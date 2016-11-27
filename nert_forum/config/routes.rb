Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  } 

  resources :users
  resources :posts
  resources :comments, only: [:create, :update, :destroy]
  
  get 'events/past', to: 'events#past_index', as: 'past_events'
  resources :events
  resources :events_users, only: [:create]


  root to: 'posts#index'
end
