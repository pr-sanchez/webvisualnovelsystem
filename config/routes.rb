Rails.application.routes.draw do

  resources :novels
  resources :characters
  resources :channels

  resources :posts do
    resources :comments
  end

  resources :discussions do
    resources :replies
  end

  root "pages#home"
  get '/about', to: 'pages#about'
  get '/character', to: 'characters#index'
  get "news" => 'posts#index'
  # get '/novel', to: 'pages#novel'
  get '/forum', to: 'discussions#index'
  get '/novel', to: 'novels#index'



  devise_for :users, controllers: { registrations: 'registrations' }


end
