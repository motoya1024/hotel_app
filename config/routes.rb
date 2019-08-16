Rails.application.routes.draw do
  
  resources :users do
    resources :favorites
  end
  resources :posts
  get "/users/:user_id/posts/", to: "posts#user_index", as: :user_posts
  resources :likes
  resources :hotels,only: [:show, :index]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get  '/hotels/map/:map', to: 'hotels#map',as: :map
  
  root 'tops#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
