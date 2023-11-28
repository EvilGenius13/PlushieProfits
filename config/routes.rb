Rails.application.routes.draw do
  root 'pages#root'
  get 'about', to: 'pages#about'

  resource :dashboard
  resources :users, only: [:edit, :update]
  
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
end
