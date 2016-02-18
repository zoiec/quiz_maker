Rails.application.routes.draw do
  
  root 'quizzes#index'

  resources :quizzes, only: [:new, :create, :index, :show] do
    resources :outcomes, only: [:new, :create]
  end
  

end
