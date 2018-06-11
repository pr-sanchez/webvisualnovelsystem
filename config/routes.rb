Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  root "pages#home"

  get '/about', to: 'pages#about'
  get "news" => 'posts#index'
  get '/novel', to: 'pages#novel'

end
