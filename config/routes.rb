Rails.application.routes.draw do

  get '/search_results', to: "pages#search_results", as: "search_results"
  resources :leads
  resources :admins
  root to: 'pages#home'

  resources :clients
  resources :services
  resources :business_types
  resources :towns
  resources :markets
  resource :session, only: [:new, :create, :destroy]

  get '/p/:service_id/:town_id', to: 'pages#show', as: "public_bulk_service"
  get '/ms/:market_id/:service_id', to: 'pages#market_service', as: "public_market_service"
  
  get '/t/:market_id/:town_id', to: 'pages#town', as: "public_town"
  get '/s/:service_id', to: 'pages#service', as: "public_service"
  get '/m/:market_id', to: "pages#market", as: "public_market"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
