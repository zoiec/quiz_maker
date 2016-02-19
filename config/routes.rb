Rails.application.routes.draw do
  
  root 'quizzes#index'

  resources :quizzes, only: [:new, :create, :index, :edit, :show] do
    resources :outcomes, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
  

end
