Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :posts
  root 'home#index'
  get 'home/about'
  get 'home/allposts'
  get 'home/whatshot'
  put '/post/:id/like', to: 'posts#like', as: 'like'
  put '/post/:id/dislike', to: 'posts#dislike', as: 'dislike'
  #get 'home/useremails'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
