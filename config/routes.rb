Rails.application.routes.draw do
  
  devise_for :users
  resource :simple_registration, only: [:new, :create]
  root 'quizzes#index'


  resources :quizzes, only: [:show, :update, :destroy]  do
    post "copy"
    resource :result, only: [:show]
  end

  resources :questions, only: [] do
    resources :answers, only: [:new, :create]
  end

  resources :answers, only: [:edit, :update]

  scope :admin do
    resources :quizzes, except: [:show, :update, :destroy]  do
      resources :outcomes, only: [:new, :create]
      resources :questions, only: [:new, :create]
    end

    resources :outcomes, only: [:edit, :update]

    resources :questions, only: [:edit, :update] do
      resources :choices, only: [:new, :create]
    end

    resources :choices, only: [:edit, :update, :destroy] do
      resources :weights, only: [:new, :create]
    end
  end

  get "/:id/", to: "quizzes#show"

end
