Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  
  root 'wineries#home'

  post "/wineries/search", to: "wineries#search", as: :winery_search
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :profiles
  resources :wineries
  resources :memories
  resources :reviews

  devise_scope :user do
      get "/signin", to: "devise/sessions#new", as: "sign_in"
      delete "/sign_out", to: "devise/sessions#destroy", as: "sign_out"
      get "sign_up", to: "devise/registrations#new", as: "sign_up"
    end

  # devise_scope :user do
  #   get "/signin", to: "devise/sessions#new", as: "sign_in"
  #   delete "/sign_out", to: "devise/sessions#destroy", as: "sign_out"
  #   get "sign_up", to: "devise/registrations#new", as: "sign_up"
  #  end

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
