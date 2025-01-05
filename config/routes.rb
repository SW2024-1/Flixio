Rails.application.routes.draw do
  # 管理者用のルーティング
  namespace :admin do
    resources :products do
      member do
        delete :destroy
        get :get_video
      end
    end
    root to: 'dashboard#index'  # 管理者ダッシュボード
    resources :users  # 管理者用のユーザー管理機能
  end
   
   # ユーザー用のルート
   root 'top#welcome'
   get 'top/main', to: 'top#main'
   get 'top/welcome', to: 'top#welcome' 
   post 'top/login', to: 'top#login', as: 'top_login'
   get 'top/logout', to: 'top#logout', as: 'top_logout'
   
   get 'search', to: 'search#search'
   get 'search/results', to: 'search#results', as: 'search_results'
   
   get 'get_video/:id', to: 'products#get_video', as: 'product_video'
   
   get "lists/show"
   
   resources :listitems, only: [:new, :create, :destroy]
   resources :lists, only: [:show]

   resources :users
   resources :products

end
