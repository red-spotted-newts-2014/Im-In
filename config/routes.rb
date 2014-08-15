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
  get 'users/:id/attending' => 'users#attending', as: "user_attending"
  get 'users/:id/created' => 'users#created', as: "user_created"

end
