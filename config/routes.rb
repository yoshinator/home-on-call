Rails.application.routes.draw do
  get '/404', to: "errors#not_found", as: "not_found"
  get '/422', to: "erros#unacceptable"
  get '/500', to: "errors#internal_error"
  root to: 'pages#home'
  get '/towns/bulk', to: "towns#bulk_new", as: "new_bulk"
  post '/towns/bulk', to: "towns#bulk_create", as: "bulk_town"
  
  resources :leads, :admins, :clients, :services, :business_types, :towns, :markets, :market_services
  resource :session, only: [:new, :create, :destroy]

# Not protected routes. 
  get '/search_results', to: "pages#search_results", as: "search_results"
  get '/zip_search', to: "pages#zip_search", as: "zip_search"
  get '/zip_click_search', to: "pages#zip_click_search", as: "zip_click_search"
  get '/json_search', to: "pages#json_search", as: "json_search"
  get '/sitemap.xml', to: "pages#sitemap"
  get '/not_available', to: "pages#not_available", as: "not_available"
  get "/blog", to: redirect('https://homeoncall.com/blog/', status: 301)

  get '/s/:service_id', to: "pages#service", as: "public_service" 
  get '/m/:market_id', to: "pages#market", as: "public_market" 
  get '/m/:market_id/:service_id', to: "pages#market_service", as: "public_market_service" 


  get '/:service_id/:town_id', to: "pages#show", as: "public_bulk_service"
  get '/:town_id', to: "pages#town", as: "public_town" 
  get '/market_services/service/:service_id', to: "market_services#service", as: "market_service_edit"
  delete '/market_services/:service_id/:market_id', to: "market_services#delete_market_service", as: "market_service_del"

end
