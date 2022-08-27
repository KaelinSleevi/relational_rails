Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/shops', to: 'shops#index'
  get '/shops/:id', to: 'shops#show'
  get '/equipments', to: 'equipments#index'
  get '/equipments/:id', to: 'equipments#show'
  get '/shops/:shop_id/equipments', to: 'shop_equipments#index'
end
