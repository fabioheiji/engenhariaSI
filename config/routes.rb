Rails.application.routes.draw do
  root 'users#new'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
end
