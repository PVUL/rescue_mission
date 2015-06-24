Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :questions

  get '/questions/:id', to: 'questions#show'

end
