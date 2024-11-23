Rails.application.routes.draw do
  get "buyitems/new"
  get "buyitems/create"
  get "buyitems/destroy"
    resources :users
    root 'top#welcome'
    get 'top/main', to: 'top#main'
    get 'top/welcome', to: 'top#welcome' 
    post 'top/login', to: 'top#login', as: 'top_login'
    get 'top/logout', to: 'top#logout', as: 'top_logout'
    get 'search', to: 'search#search'
    get 'search/results', to: 'search#results', as: 'search_results'
    get 'get_video/:id', to: 'products#get_video', as: 'product_video'
    get "lists/show"
    resources :products
    resources :listitems, only: [:new, :create, :destroy]
    resources :lists, only: [:show]
    resources :buyitems, only: [:new, :create, :destroy]  # 新規作成と削除を扱う
    get 'buys', to: 'buys#show', as: 'buys'
end
