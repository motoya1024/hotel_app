Rails.application.routes.draw do
  
  resources :users 
  resources :hotels,except: [:edit, :update, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get  '/favoritehotel/:id',   to: 'hotels#favoritehotel',as: :favoritehotel
  get  '/hotels/:id/:user_id/edit',   to: 'hotels#edit', as: :edit_hotel
  patch  '/hotels/:id/:user_id',   to: 'hotels#update', as: :update_hotel
  delete  '/hotels/:id/:user_id',   to: 'hotels#destroy', as: :delete_hotel
  
  root 'tops#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
