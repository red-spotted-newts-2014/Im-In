Rails.application.routes.draw do

  root 'users#index'

  resources :events do
    resources :invitations, only: [:create, :new]
  end
  resources :users

  post 'users/login' => 'users#login', as: 'login'
  get 'users/logout' => 'users#logout', as: 'logout'
  post 'users/follow' => 'users#follow', as: 'follow'
  post 'users/unfollow' => 'users#unfollow', as: 'unfollow'
  get 'users/:id/events_attending' => 'users#events_attending', as: "user_events_attending"
  get 'users/:id/created' => 'users#created', as: "user_events_created"
  get 'events/:id/friends_attending' => 'events#friends_attending', as: "events_friends_attending"
end
