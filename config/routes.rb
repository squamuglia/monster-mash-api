Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/hands', to: 'hands#index'
      get '/heads', to: 'heads#index'
      get '/feet', to: 'foots#index'
      get '/users', to: 'users#index'

    end
  end
end