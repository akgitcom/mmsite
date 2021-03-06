Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :path => "/admin/users"
    # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'not_found' => 'pages#not_found'

  resources :users
  get '/users/:id' => 'users#show'

  resources :articles
  get '/articles/page/:page' => 'articles#index'
  get '/ae:aid'=> 'articles#show'

  resources :products
  get '/products/page/:page' => 'products#index'
  get '/pt:id'=> 'products#show'
  resources :downloads
  get '/downloads/page/:page' => 'downloads#index'

  resources :faqs
  get '/faqs/page/:page' => 'faqs#index'

  resources :categories
  get '/categories/page/:page' => 'categories#index'

  get 'admin/products/search' => 'admin/products#search'
  get 'admin/articles/search' => 'admin/articles#search'
  get 'admin/categories/search' => 'admin/categories#search'
  post 'admin/articles/state' => 'admin/articles#state'
  post 'admin/categories/state' => 'admin/categories#state'
  post 'admin/products/state' => 'admin/products#state'
  post 'admin/products/homepage' => 'admin/products#homepage'

  namespace :admin do
    root to: "singlepages#index"
    resources :users, :articles, :products, :downloads, :faqs, :categories, :singlepages, :home, :photos,:siteconfigs

    get 'users/:id' => 'users#show'
    get 'users/page/:page' => 'users#index'
    get 'articles/page/:page' => 'articles#index'
    get 'products/p/:page' => 'products#index'

    get 'downloads/page/:page' => 'downloads#index'
    get 'faqs/page/:page' => 'faqs#index'
    get 'categories/page/:page' => 'categories#index'
    get 'singlepages/page/:page' => 'singlepages#index'
    resources :articles do
      resources :products
    end
    mount Ckeditor::Engine => '/ckeditor'
  end


  resources :singlepages
  get '/singlepages/page/:page' => 'singlepages#index'
  # get '/company', :controller => 'singlepages', :action => 'show', :sid => 1  都可以
  # get '/company', to: 'singlepages#show', sid: 1
  # get '/qualificatio', to: 'singlepages#show', sid: 2
  # get '/contact', to: 'singlepages#show', sid: 3
  # get '/factory', to: 'singlepages#show', sid: 4
  # get '/case', to: 'singlepages#show', sid: 5

  DynamicRouter.load

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
