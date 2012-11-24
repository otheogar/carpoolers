Carpool::Application.routes.draw do
  resources :trips_connects

  resources :messages

  resources :trip_requests
  resources :users

  devise_for :user_logins

  get "feed/index"



  get "userhome/index", :as => 'userhome'
  
  match '/search' => 'userhome#search', :as => 'search'
  match '/trippost' => 'trips#create', :as => 'trippost'
  match '/connect' => 'userhome#connect', :as => 'connect'
  match '/rating' => 'userhome#rating', :as => 'rating'
  match '/trip_owner' => 'user_profiles#owner', :as => 'trip_owner'
  match '/send_message' => 'messages#create', :as => 'sendmessage'
  match '/updateread' => 'messages#update_read', :as => 'updateread'
  match '/delete_trip' => 'userhome#delete_trip', :as => 'delete_trip'
  match '/disconnect_trip' => 'userhome#disconnect_trip', :as => 'disconnect_trip'



  resources :user_profiles
  get "welcome/index"


  match '/fetch_mytrips' => 'userhome#fetch_mytrips', :as => 'fetch_mytrips'
  match '/fetch_new' => 'userhome#fetch_new', :as => 'fetch_new'
  match '/reload_feed' => 'userhome#reload_feed', :as => 'reload_feed'
  match '/get_passengers' => 'userhome#get_passengers', :as => 'get_passengers'
  match '/get_drivers' => 'userhome#get_drivers', :as => 'get_drivers'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
   match 'edit_profile', to: 'user_profiles#get_by_email', as: 'edit_profile'
  
  resources :users
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
   root to: 'welcome#index', as: 'welcome'



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
