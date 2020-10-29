Rails.application.routes.draw do
  resources :users
  root 'static_pages#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'users#welcome'
  resources :gossips do
    resources :comments
    resources :likes
  end
  get '/cities/:city', to: 'cities#show'
  resources :sessions, only:[:new,:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
