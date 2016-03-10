Rails.application.routes.draw do
  
  devise_for :users
  root 'quizzes#index'


  resources :quizzes, only: [:show, :update, :destroy]  do
    resource :result, only: [:show]
  end

  resources :questions, only: [:show] do
    resources :answers, only: [:new, :create]
  end

  resources :answers, only: [:edit, :update]

  scope :admin do
    resources :quizzes, except: [:show, :update, :destroy]  do
      resources :outcomes, only: [:new, :create]
      resources :questions, only: [:new, :create]
    end

    resources :outcomes, only: [:edit, :update]

    resources :questions, only: [:edit] do
      resources :choices, only: [:new, :create]
    end

    resources :choices, only: [:edit] do
      resources :weights, only: [:new, :create]
    end
  end

  get "/:id/", to: "quizzes#show"

end
