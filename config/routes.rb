Lakara::Application.routes.draw do

  root :to => 'roopas#show'

  get 'roopa', to: 'roopas#show'
  match 'login', to: 'sessions#create', :via => [:get, :post], as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'

  resources :dhatus
  resources :users
  resources :sessions

  match '*a', :to => 'errors#routing', :via => [:get, :post], as: 'error'

end
