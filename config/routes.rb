Rails.application.routes.draw do
  resources :reviews
  resources :products
  resources :users
  root 'application#hello'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
