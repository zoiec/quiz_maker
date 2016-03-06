require 'rails_helper'

RSpec.describe ChoicesController do

  describe "#edit" do
    it 'returns a choice' do
      choice = create_choice

      get :edit, id: choice.id

      expect(assigns(:choice)).to eq(choice)
    end

    it 'render the edit template' do
      choice = create_choice

      get :edit, id: choice.id

      expect(response).to render_template(:edit)
    end
  end

  describe "#new" do
    it 'handles the new action correctly' do
      question = stub_question

      get :new, question_id: question.id

      expect(assigns(:choice)).to be_a_new(Choice)
    end

    it 'renders the new template' do
      question = stub_question

      get :new, question_id: question.id

      expect(response).to render_template(:new)
    end

    describe "#create" do
      context 'with valid data' do
        it 'creates a new choice' do
          question = create_question
          choice = FactoryGirl.attributes_for(:choice)

          post :create, choice: choice, question_id: question.id

          expect(Choice.all.count).to eq(1)
        end

        it 'renders the edit template' do
          question = create_question
          choice = FactoryGirl.attributes_for(:choice)

          post :create, choice: choice, question_id: question.id

          expect(response).to redirect_to(edit_question_path(question))
        end
      end

      context 'with invalid data' do
        it 'does not create a new choice' do
          question = create_question
          choice = {body: ""}

          post :create, choice: choice, question_id: question.id

          expect(Choice.all.count).to eq(0)
        end

        it 'renders the new template' do
          question = create_question
          choice = {body: ""}

          post :create, choice: choice, question_id: question.id

          expect(response).to render_template(:new)
        end
      end
    end
  end

  def create_choice
    FactoryGirl.create(:choice)
  end

  def create_question
    FactoryGirl.create(:question)
  end

  def stub_question
    question = double("question", id: 1)
    allow(Question).to receive(:find).with("1").and_return(question)
    question
  end

end
