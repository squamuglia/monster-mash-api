 Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/hands', to: 'hands#index'
      post '/hands', to: 'hands#create'
      get '/hands/:id', to: 'hands#show'

      get '/heads', to: 'heads#index'
      post '/heads', to: 'heads#create'
      get '/heads/:id', to: 'heads#show'

      get '/feet', to: 'foots#index'
      post '/feet', to: 'foots#create'
      get '/feet/:id', to: 'foots#show'

      get '/users', to: 'users#index'
      post '/users', to: 'users#create'
      get '/users/:id', to: 'users#show'

      post '/login', to: 'auth#create'
      get '/trytoken', to: 'auth#get_user'

      get '/images/feet', to: 'foots#logo'
      get '/images/hands', to: 'hands#logo'
      get '/images/heads', to: 'heads#logo'
    end
  end
end
