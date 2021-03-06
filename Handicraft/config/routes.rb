Rails.application.routes.draw do

  # For admin dashboard
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'bid_history/index'

  get 'purchase_history/index'

  resources :bid_winners

  resources :searches

  #devise_for :users do
    # replace devise_for :users with:
  # get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session_path

  #end

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :roles

  resources :bid_actions

  resources :bid_carts

  get 'checkout/index'
  get 'checkout/confirmation'

  get 'error_handler/index'

  resources :cart_items

  resources :shopping_carts

  resources :order_details

  resources :orders

  resources :order_shipments

  resources :shipping_books

  resources :discounts

  resources :state_taxes

  resources :sellers

  resources :histories

  resources :customers

  resources :products

  resources :product_details

  get '/sellers' => "sellers#index"
  get '/sellers/new' => "sellers#new"

  get '/dashboard' =>"dashboard#index"

  #get '/product_details'=>"product_details#index"
  get 'product_details/index'

  get '/catalog' =>"catalog#index"

  get 'catalog/index'

  get '/contact' =>"contact#index"


  get 'home/index'

  get 'product_details/index'

  get '/home' =>"home#index"

  get '/about' =>"about#index"

  get 'users/sign_in' =>"devise/sessions#new"

  get 'users/sign_up' =>"devise/registrations#new"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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
