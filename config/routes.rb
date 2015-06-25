Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :questions do
    resources :answers, only: [:index, :new, :create, :update]
  end
  resources :answers, only: [:show, :update, :destroy]

end
