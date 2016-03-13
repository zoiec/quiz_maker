require "rails_helper"

describe ResultsController do

  describe "#show" do
    it "assigns a result" do
      devise_login_as_user
      quiz = FactoryGirl.create(:quiz)
      outcome = double("outcome")
      result = double("result", 
                      needs_recomputation?: false,
                      outcome: outcome).as_null_object
      allow(Result).to receive(:includes).and_return(result)

      get :show, quiz_id: quiz.id

      expect(assigns(:result)).to be(result)
      expect(assigns(:outcome)).to be(outcome)
    end
  end

end
