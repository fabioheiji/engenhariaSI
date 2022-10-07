Rails.application.routes.draw do
  root 'pages#home'
  get 'matches/:id/new'=>'matches#new'
  get 'matches/:id' => 'matches#show'
end
