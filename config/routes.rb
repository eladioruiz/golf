ActionController::Routing::Routes.draw do |map|
  map.resources :course_types

  map.resources :coursetypes

  map.resources :course_types


  # Casos particulares
  map.connect '/matches/week', :controller => 'matches', :action => 'this_week'
  map.connect '/matches/lastmonth', :controller => 'matches', :action => 'last_month'
  map.connect '/matches/lastmatches', :controller => 'matches', :action => 'last_matches'
  map.connect '/matches/bestmatches', :controller => 'matches', :action => 'best_matches'
  map.connect '/matches/mymatches', :controller => 'matches', :action => 'my_matches'

  map.connect '/testcharts/view', :controller => 'test_chart', :action => 'view'
  map.connect '/testcharts/y_right', :controller => 'test_chart', :action => 'y_right'
  map.connect '/testcharts/y_right2', :controller => 'test_chart', :action => 'y_right2'

  map.connect '/home', :controller => 'home', :action => 'index'

  map.connect '/charts/pie_courses', :controller => 'charts', :action => 'pie_courses'
  map.connect '/charts/basic_chart', :controller => 'charts', :action => 'basic_chart'
  map.connect '/charts/simple_chart', :controller => 'charts', :action => 'simple_chart'

  map.resources :users
  map.resource :session, :controller => 'session'

  map.resources :holes

  map.resources :tees

  map.resources :courses

  map.resources :matches do |match|
    match.resources :players do |player| 
      player.resources :cards
    end
  end
  
  map.resources :cards do |card|
    card.resources :card_strokes
  end
  
  map.resources :matches

  map.resources :players

  map.resources :cards
  
  map.resources :card_strokes

  map.resources :homes

  map.resources :charts
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'

  #map.resources :location
  #map.root :controller => "location", :action => "index"
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => "matches"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  
#<<<<<<< HEAD
  #map.root :controller => "session", :action => "new"
  
#=======
  map.root :controller => "home", :action => "index"

  map.connect ':controller/:id/:action'
  map.connect ':controller/:id/:action.:format'

#>>>>>>> 2ec3d9d35656f91a1dad08e4e5737a3fad207701
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
