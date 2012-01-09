Rinternal::Application.routes.draw do
  root :to => 'dashboards#frontpage'

  resources :users
  resources :submissions

  match '/account/username', to: 'sessions#set_username', as: 'set_username'
  match '/auth/force/:username', to: 'sessions#force'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/logout', to: 'sessions#destroy'
end
