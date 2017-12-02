Rails.application.routes.draw do
  resources :crime_records
  resources :featured_crimes
  resources :police_stations
  resources :most_wanteds
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crime_types', to: 'crime_types#index'
end
