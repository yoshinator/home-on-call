Rails.application.routes.draw do
root to: 'pages#home'

  resources :clients
  resources :services
  resources :business_types
  resources :towns
  resources :markets

  get '/p/:service_id/:town_id', to: 'pages#show'
  get '/t/:market_id/:town_id', to: 'pages#town'
  get '/s/:market_id/:service_id', to: 'pages#service'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
