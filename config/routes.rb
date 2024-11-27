Rails.application.routes.draw do
   root 'top#welcome'
   get 'top/main', to: 'top#main'
   get 'top/welcome', to: 'top#welcome' 
   post 'top/login', to: 'top#login', as: 'top_login'
   get 'top/logout', to: 'top#logout', as: 'top_logout'
   
   resources :users do
     get 'watch_history', on: :member
   end
   
   resources :products do
     get 'watch_video', on: :member
   end
   
   
   
   get 'search', to: 'search#search'
   get 'search/results', to: 'search#results', as: 'search_results'
   get 'get_video/:id', to: 'products#get_video', as: 'product_video'

end
