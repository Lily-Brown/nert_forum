Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } 

  resources :users
  resources :posts
  resources :comments, only: [:new, :create]

  root to: 'posts#index'
end
