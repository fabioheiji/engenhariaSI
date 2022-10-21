Rails.application.routes.draw do
  root 'pages#home'

  resources :matches
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

end

