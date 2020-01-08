Rails.application.routes.draw do
  resources :clients
  resources :services
  resources :business_types
  resources :towns
  resources :markets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
