Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :mailform
  resources :blogs
  get 'CV', to: 'pages#CV', as: :cv
  resources :coachingrequests
  get 'aboutus', to: 'pages#aboutus', as: :aboutus
  resources :ukfinancejobs
  get 'interviews', to: 'pages#interviews', as: :interview
  get '/downloads/:filename', to: 'downloads#download', as: 'download_file'
  # Defines the root path route ("/")
  # root "articles#index"
end
