Rails.application.routes.draw do
  resources :discussions
  resources :posts do
    resources :comments
  end

  root "pages#home"
  get '/about', to: 'pages#about'
  get "news" => 'posts#index'
  get '/novel', to: 'pages#novel'
  get '/forum', to: 'discussions#index'


  devise_for :users, controllers: { registrations: 'registrations' }


end
