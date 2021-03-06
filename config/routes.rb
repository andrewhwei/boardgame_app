Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/follows', to: 'follows#index'
  post '/follows', to: 'follows#create'
  delete '/follows/:id', to: 'follows#destroy'

  get '/owned_games', to: 'ownerships#index'
  post '/owned_games', to: 'ownerships#create'
  get '/owned_games/:id/edit', to: 'ownerships#edit'
  patch '/owned_games/:id', to: 'ownerships#update'
  delete '/owned_games/:id', to: 'ownerships#destroy'

  get '/pictures', to: 'pictures#index'
  post '/pictures', to: 'pictures#create'
  patch '/pictures/:id', to: 'pictures#update'
  delete '/pictures/:id', to: 'pictures#destroy'
  
  get '/boardgames', to: 'boardgames#index'
  get '/boardgames/new', to: 'boardgames#new', as: 'new_boardgame'
  get '/boardgames/:id', to: 'boardgames#show', as: 'boardgame'
  get '/boardgames/:id/edit', to: 'boardgames#edit', as: 'edit_boardgame'
  post '/boardgames', to: 'boardgames#create'
  patch '/boardgames/:id', to: 'boardgames#update'
  delete '/boardgames/:id', to: 'boardgames#destroy'

  get '/categories', to: 'categories#index'

  namespace :api do
    namespace :v1 do
      get '/boardgames', to: 'boardgames#index'
      
      get '/categories', to: 'categories#index'
      get '/categories/:id/edit', to: 'categories#update'
      patch '/categories/:id', to: 'categories#update'
      delete '/categories/:id', to: 'categories#destroy'
      post '/categories', to: 'categories#create'
    end
  end


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:k
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
