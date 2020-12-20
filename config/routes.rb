Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'

  resources :users, only: [:index, :show, :new, :create]
  resources :posts, only: [:index, :show, :new, :create]
  

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
end
