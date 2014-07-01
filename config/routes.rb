Rails.application.routes.draw do
  resources :networks
  get 'network', to: 'main#network'
  root 'main#index'  
end
