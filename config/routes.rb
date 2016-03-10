Rails.application.routes.draw do
  
  devise_for :users
  root 'quizzes#index'

  resources :quizzes do
    resources :outcomes, only: [:new, :create]
    resource :result, only: [:show]
    resources :questions, only: [:new, :create]
  end
  resources :outcomes, only: [:edit, :update]
  resources :questions, only: [:edit, :show] do
    resources :choices, only: [:new, :create]
    resources :answers, only: [:new, :create]
  end
  resources :answers, only: [:edit, :update]
  resources :choices, only: [:edit] do
    resources :weights, only: [:new, :create]
  end
  resources :outcomes, only: [:edit]  
  get "/:id/", to: "quizzes#show"

end
