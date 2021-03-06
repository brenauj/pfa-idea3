Idea3::Application.routes.draw do

  get "comment/create"
  match "comment/:id/moderate" => 'comment#moderate'
  match "comment/:id/view" => 'comment#view'
  match "comment/:id/edit" => 'comment#edit'
  match "comment/:id/delete" => 'comment#delete'

  post "comment/create"
  post "comment/delete"
  post "comment/edit"

  get "home/home"

  get "ideas/create"
  match "ideas/:id/view" => 'ideas#view'
  match "ideas/:id/delete" => 'ideas#delete'
  match "ideas/:id/edit" => 'ideas#edit'

  post "ideas/create"
  post "ideas/delete"
  post "ideas/edit"

  get "boxes/create"
  match "boxes/:id/edit" => 'boxes#edit'
  get "boxes/list"
  match "boxes/:id/view" => 'boxes#view'
  match "boxes/:id/delete" => 'boxes#delete'

  post "boxes/create"
  post "boxes/edit"
  post "boxes/delete"

  get "users/register"
  match "users/:id/view" => 'users#view'
  match "users/:id/edit" => 'users#edit'
  match "users/:id/delete" => 'users#exit'
  get "users/list"
  match "users/:id/password" => "users#password"
  get "users/login"

  post "users/register"
  post "users/edit"
  post "users/delete"
  post "users/password"
  post "users/login"
  get "users/logout"
  post "users/logout"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  root :to => "home#home"
end
