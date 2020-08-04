Rails.application.routes.draw do
  devise_for :users
  root 'links#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :links, except: :index
  
  resources :users, only: [:new, :create]

end
