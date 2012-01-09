Rinternal::Application.routes.draw do
  root :to => 'dashboards#frontpage'

  resources :users

  match '/account/username', to: 'sessions#set_username', as: 'set_username'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
end
