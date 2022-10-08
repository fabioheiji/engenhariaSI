Rails.application.routes.draw do
  root 'pages#home'
  
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'

  resources :matches
end
