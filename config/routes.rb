Rails.application.routes.draw do
   get 'top/main'
   root 'top#main'
   post 'top/login', to: 'top#login'
   resources :users
   resources :products, only: [:index]
end
