Rails.application.routes.draw do
  
  root               'pages#home'
  get   'help'    => 'pages#help'
  get   'about'   => 'pages#about'
  get   'contact' => 'pages#contact'
  get   'signup'  => 'users#new'
  get   'login'   => 'sessions#new'
  post  'login'   => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users

  #     users GET   /users(.:format)              users#index
  #          POST   /users(.:format)              users#create
  #  new_user GET   /users/new(.:format)          users#new
  # edit_user GET   /users/:id/edit(.:format)     users#edit
  #      user GET   /users/:id(.:format)          users#show
  #         PATCH   /users/:id(.:format)          users#update
  #           PUT   /users/:id(.:format)          users#update
  #        DELETE   /users/:id(.:format)          users#destroy
  
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

  # default route syntax at bottom instead of get... will match if all other routes fail
  match ':controller(/:action(/:id(.:format)))', :via => :get
end
