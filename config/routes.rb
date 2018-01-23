Rails.application.routes.draw do
  resources :districts
  resources :issues
  resources :views
  resources :stances
  resources :users
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
