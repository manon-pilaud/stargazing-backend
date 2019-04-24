Rails.application.routes.draw do
get 'auth_controller/create'
namespace :api do
  namespace :v1 do
    resources :user_locations
    resources :users
    resources :locations
    resources :users, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
    end
  end
end
