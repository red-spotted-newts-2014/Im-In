Rails.application.routes.draw do

  root 'users#index'

  get 'events/:id/attending' => 'events#attending', as: "events_users_attending"

  resources :events do
    resources :invitations, only: [:create, :new]
  end

  post 'users/login' => 'users#login', as: 'login'
  get 'users/logout' => 'users#logout', as: 'logout'

  post 'users/follow' => 'users#follow', as: 'follow'
  post 'users/unfollow' => 'users#unfollow', as: 'unfollow'

  get 'users/:id/attending' => 'users#attending', as: "user_events_attending"
  get 'users/:id/created' => 'users#created', as: "user_events_created"

  get 'users/:id/following' => 'users#following', as: "user_following"
  get 'users/:id/followers' => 'users#followers', as: "user_followers"


  # get 'events/:id/attending' => 'events#attending', as: "events_users_attending"

  resources :users
end
