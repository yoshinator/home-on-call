Rails.application.routes.draw do

  get '/404', to: "errors#not_found"
  get '/422', to: "erros#unacceptable"
  get '/500', to: "errors#internal_error"
  root to: 'pages#home'
  get '/towns/bulk', to: "towns#bulk_new", as: "new_bulk"
  post '/towns/bulk', to: "towns#bulk_create", as: "bulk_town"
  
  resources :leads, :admins, :clients, :services, :business_types, :towns, :markets
  resource :session, only: [:new, :create, :destroy]

# Not protected routes. 
  get '/search_results', to: "pages#search_results", as: "search_results"
  get '/sitemap.xml', to: "pages#sitemap"

  ####### temporary routes until googles stops indexing
   get '/s/affordable-new-construction-remodeling-hvac-installation', to: "pages#redirect_service"
   get '/s/fast-air-conditioner-service-call', to: "pages#redirect_fast"
   get '/s/junk-removal-cost', to: "pages#redirect_junk_main"

  ####### end temp

  get '/s/:service_id', to: "pages#service", as: "public_service" 
  get '/m/:market_id', to: "pages#market", as: "public_market" 
  get '/m/:market_id/:service_id', to: "pages#market_service", as: "public_market_service" 

  # temporary routes until googles stops indexing
  get '/fast-air-conditioner-service-call/:town_id', to: "pages#redirect_emergency"
  
  get '/affordable-hvac-duct-installation/:town_id', to: "pages#redirect_duct"
  get '/affordable-air-duct-cleaning/:town_id', to: "pages#redirect_duct"
  
  get '/best-home-heater-maintenance/:town_id', to: "pages#redirect_heat"
  
  get '/commercial-hvac-repair/:town_id', to: "pages#redirect_repair"
  get '/low-cost-hvac-maintenance-contractor/:town_id', to: "pages#redirect_repair"

  get '/affordable-new-construction-remodeling-hvac-installation/:town_id', to: "pages#redirect_installation"
  get '/best-commercial-hvac-installation/:town_id', to: "pages#redirect_installation"
  get  '/junk-removal-cost/:town_id', to: "pages#redirect_junk"
  # end of temporary routes

  get '/:service_id/:town_id', to: "pages#show", as: "public_bulk_service"
  get '/:town_id', to: "pages#town", as: "public_town" 
  

end
