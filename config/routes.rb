Rails.application.routes.draw do
  resources :meetings do 
    resources :meetingcomments
  end
  resources :profiles, except: [:edit]
  patch '/profiles/:id', to: 'profiles#update', as: 'update_profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index', as: 'root'
  resources :mailform
  resources :blogs
  get 'CV', to: 'pages#CV', as: :cv
  get 'adminpanel', to: 'pages#adminpanel', as: :adminpanel
  get 'lol', to: 'pages#lol', as: :lol
  get 'longermsg', to: 'pages#longermsg', as: :longermsg
  get 'daily', to: 'pages#daily', as: :daily
  get 'weekly', to: 'pages#weekly', as: :weekly
  get 'meetingfilter', to: 'pages#meetingfilter', as: :meetingfilter
  resources :coachingrequests
  get 'aboutus', to: 'pages#aboutus', as: :aboutus
  get 'networking', to: 'pages#networking', as: :networking
  get 'request submission', to: 'pages#requestsubmission', as: :requestsubmission
  resources :ukfinancejobs, except: [:edit] do 
    resources :comments
    member do
      post 'favorite', to: 'ukfinancejobs#favorite'
      delete 'unfavorite', to: 'ukfinancejobs#unfavorite'
    end
    collection do
      get 'favorites', to: 'ukfinancejobs#favorites'
    end
  end
  patch '/ukfinancejobs/:id', to: 'ukfinancejobs#update', as: 'update_ukfinancejob'
  get '/ukfinancejobs/:id/edit', to: 'ukfinancejobs#edit', as: 'edit_ukfinancejob'
  get 'interviews', to: 'pages#interviews', as: :interview
  get '/downloads/:filename', to: 'downloads#download', as: 'download_file'
  # Defines the root path route ("/")
  # root "articles#index"
end
