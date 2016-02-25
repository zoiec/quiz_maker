Rails.application.routes.draw do
  
  devise_for :users
  root 'quizzes#index'

  resources :quizzes, only: [:new, :create, :index, :edit, :show] do
    resources :outcomes, only: [:new, :create]
    resources :questions, only: [:new, :create]
  end
  resources :questions, only: [:edit] do
    resources :answers, only: [:new, :create]
  end
  resources :answers, only: [:edit] do
    resources :weights, only: [:new, :create]
  end
  resources :outcomes, only: [:edit]  

end
