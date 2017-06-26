Rails.application.routes.draw do
  resources :comments
  resources :products
  root 'products#index'


  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }


end
