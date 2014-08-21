Rails.application.routes.draw do

  root 'users#index'

  post 'events/create_ios' => 'events#create_ios'
  get 'events/:id/attending' => 'events#attending', as: "events_users_attending"

  post 'users/login' => 'users#login', as: 'login'
  post 'users/login_ios' => 'users#login_ios', as: 'login_ios'
  get 'users/logout' => 'users#logout', as: 'logout'
  get 'users/logout_ios' => 'users#logout_ios'
  get 'users/profile' => 'users#profile', as: 'profile'

  resources :events do
    resources :invitations, only: [:create, :new, :update]
  end


  post 'users/follow' => 'users#follow', as: 'follow'
  post 'users/unfollow' => 'users#unfollow', as: 'unfollow'

  get 'users/:id/attending' => 'users#attending', as: "user_events_attending"
  get 'users/:id/created' => 'users#created', as: "user_events_created"

  get 'users/:id/following' => 'users#following', as: "user_following"
  get 'users/:id/followers' => 'users#followers', as: "user_followers"


  # get 'events/:id/attending' => 'events#attending', as: "events_users_attending"

  resources :users
end
