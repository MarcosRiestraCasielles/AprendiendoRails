Rails.application.routes.draw do
  resources :usuarios
  get 'bienvenido/index'
  root 'bienvenido#index'
  resources :usuarios do
    resources :opinions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
