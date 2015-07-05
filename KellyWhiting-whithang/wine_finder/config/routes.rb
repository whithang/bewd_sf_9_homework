Rails.application.routes.draw do
  # get 'fb_sessions/create'

  # get 'fb_sessions/destroy'

  # get 'fb_home/show'


  # get 'auth/:provider/callback', to: 'fb_sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'fb_sessions#destroy', as: 'signout'

  devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :users
  
  devise_scope :user do
      get "/signin", to: "devise/sessions#new", as: "sign_in"
      delete "/sign_out", to: "devise/sessions#destroy", as: "sign_out"
      get "sign_up", to: "devise/registrations#new", as: "sign_up"
  end

  root 'wineries#home'
  # root to: "fb_home#show"

  # get "memories/select", to: "memories#select", as: :memory_select

  post "/wineries_search", to: "wineries#search", as: :winery_search
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :users do
    resources :profiles
  end

  resources :wineries do
    resources :reviews
  end

  resources :users do
    resources :memories
  end

  resources :wineries do
    resources :memories
    resources :memory_details
  end

  resources :wineries do
    resources :memories do
      resources :memory_details
    end
  end


  resources :memories do
    resources :memory_details
  end

  resources :profiles
  resources :wineries
  resources :memories
  resources :reviews
  resources :memory_details

  resources :fb_sessions, only: [:create, :destroy]
  

  

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
