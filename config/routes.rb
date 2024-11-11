Rails.application.routes.draw do
   root 'top#welcome'
   get 'top/main', to: 'top#main'
   get 'top/welcome', to: 'top#welcome' 
   post 'top/login', to: 'top#login', as: 'top_login'
   get 'top/logout', to: 'top#logout', as: 'top_logout'
   resources :users
   resources :products, only: [:index]
   get 'get_image/:id', to: 'images#get_image'
end
