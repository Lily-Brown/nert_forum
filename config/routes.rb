Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } 

  resources :users
  resources :posts
end
