Lakara::Application.routes.draw do

  root :controller => 'static', :action => '/'


  resources :roopas, :only=>[:show]

  post 'login', to: 'sessions#create', as: 'login'
  post 'logout', to: 'sessions#destroy', as: 'logout'
  post 'signup', to: 'users#create', as: 'signup'

  match '*a', :to => 'errors#routing', :via => [:get, :post]

end
