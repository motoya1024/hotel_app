Rails.application.routes.draw do
  
  resources :users do
    resources :favorites
    resources :posts, except: [:show]
  end
  resources :posts, only: [:index]
  get "/users/:user_id/user_posts/", to: "posts#user_index", as: :user_posts_index
  resources :likes,only: [:create, :destroy]
  resources :hotels,only: [:index]
  get "/hotel/", to: "hotels#show", as: :hotel_show
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get  '/hotels/map/:map', to: 'hotels#map',as: :map
  
  root 'tops#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
