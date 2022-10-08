Rails.application.routes.draw do
  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root 'pages#home'

  resources :matches, :users
end

