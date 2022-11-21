Rails.application.routes.draw do
  root 'pages#home'

  resources :matches
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get    'signup'  => 'users#new'
  post   'signup'  => 'users#create'
  
  post   'create_participate_in_match'   => 'matches#create_participate_in_match'
  post   'kick_player'   => 'matches#kick_player'
end

