Rails.application.routes.draw do
<<<<<<< HEAD
 
  devise_for :users
  root 'links#index'
  
  resources :users, only: [:new, :create]
=======
  root 'links#index'
>>>>>>> 67e9149bc9b893837e66bdb8225facd2d838ad54

  resources :links, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post :upvote, on: :member
    post :downvote, on: :member
  end
<<<<<<< HEAD
  get '/comments' => 'comments#index'

=======

  get '/comments' => 'comments#index'
  get '/newest' => 'links#newest', as: :newest_links

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]
end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> 67e9149bc9b893837e66bdb8225facd2d838ad54
end
