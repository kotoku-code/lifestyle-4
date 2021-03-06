Rails.application.routes.draw do
 
  devise_for :users
  root 'links#index'
  
  resources :users, only: [:new, :create]

  resources :links, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post :upvote, on: :member
    post :downvote, on: :member
  end
  get '/comments' => 'comments#index'

end
