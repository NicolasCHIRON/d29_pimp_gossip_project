Rails.application.routes.draw do
  get '/welcome/:first_name', to: "welcome#welcome"
  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'

  resources :gossips
  root to: redirect('/gossips')

  resources :gossips do
    resources :comments, except: [:show, :index, :new]
  end

  resources :users, only: [:show]
  resources :cities, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
