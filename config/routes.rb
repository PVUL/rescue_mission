Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :questions do
    resources :answers

  end
  
end
