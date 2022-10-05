Rails.application.routes.draw do
  root 'users#new'
  get 'signup' => 'users#new'
end
