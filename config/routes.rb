ActionController::Routing::Routes.draw do |map|
  
  

  map.resources :contacts

  map.resources :rights

  map.resources :privacy_friends

  map.resources :privacy_types

  map.resources :course_types

  map.resources :coursetypes

  map.resources :contacts
  
  # Casos particulares
  map.connect '/matches/week', :controller => 'matches', :action => 'this_week'
  map.connect '/matches/lastmonth', :controller => 'matches', :action => 'last_month'
  map.connect '/matches/lastmatches', :controller => 'matches', :action => 'last_matches'
  map.connect '/matches/bestmatches', :controller => 'matches', :action => 'best_matches'
  map.connect '/matches/mymatches', :controller => 'matches', :action => 'my_matches'

  map.connect '/courses/findlikebyname', :controller => 'courses', :action => 'find_like_by_name'

  map.connect '/holes/findlikebynumber', :controller => 'holes', :action => 'find_like_by_number'
  map.connect '/holes/getholes', :controller => 'holes', :action => 'get_holes'

  map.connect '/users/publicusers', :controller => 'users', :action => 'public_users'
  map.connect '/users/recover_password', :controller => 'users', :action => 'recover_password'

  map.connect '/testcharts/view', :controller => 'test_chart', :action => 'view'
  map.connect '/testcharts/y_right', :controller => 'test_chart', :action => 'y_right'
  map.connect '/testcharts/y_right2', :controller => 'test_chart', :action => 'y_right2'

  #map.connect '/home', :controller => 'home', :action => 'index'

  map.connect '/charts/pie_courses', :controller => 'charts', :action => 'pie_courses'
  map.connect '/charts/regularity_strokes', :controller => 'charts', :action => 'regularity_strokes'
  map.connect '/charts/regularity_per_hole', :controller => 'charts', :action => 'regularity_per_hole'
  map.connect '/charts/compare_match', :controller => 'charts', :action => 'compare_match'
  map.connect '/charts/graphs_match', :controller => 'charts', :action => 'graphs_match'

  map.connect '/ayuda', :controller => 'microsites', :action => 'ayuda'

  map.connect '/api/authentication',  :controller => 'api', :action => 'authentication',  :conditions => {:method => :post}
  map.connect '/api/getcourses',      :controller => 'api', :action => 'getcourses',      :conditions => {:method => :post}
  map.connect '/api/getcourse',       :controller => 'api', :action => 'infocourse',      :conditions => {:method => :post}
  map.connect '/api/getmatches',      :controller => 'api', :action => 'getmatches',      :conditions => {:method => :post}
  map.connect '/api/getmatch',        :controller => 'api', :action => 'getmatch',        :conditions => {:method => :post}
  map.connect '/api/deletematch',     :controller => 'api', :action => 'deletematch'#,        :conditions => {:method => :post}
  map.connect '/api/getfriends',      :controller => 'api', :action => 'getfriends',      :conditions => {:method => :post}
  map.connect '/api/getinfoholes',    :controller => 'api', :action => 'getinfoholes',    :conditions => {:method => :post}
  map.connect '/api/getstrokes',      :controller => 'api', :action => 'getstrokes',      :conditions => {:method => :post}
  map.connect '/api/uploadmatch',     :controller => 'api', :action => 'uploadmatch',     :conditions => {:method => :post}
  map.connect '/api/uploadmatchform', :controller => 'api', :action => 'uploadmatchform'

  map.resources :users
  
  map.resource :session, :controller => 'session'

  map.resources :holes

  map.resources :tees

  map.resources :microsites

  map.resources :courses do |course|
    course.resources :course_images
  end

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

  map.resources :course_images

  map.resources :homes

  map.resources :charts
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'

  map.home '/home', :controller => 'home', :action => 'index'

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
  #map.root :controller => "home", :action => "index"
  map.root :controller => "session", :action => "new"

  map.connect ':controller/:id/:action'
  map.connect ':controller/:id/:action.:format'

#>>>>>>> 2ec3d9d35656f91a1dad08e4e5737a3fad207701
  
  #map.connect ':controller/:action/:id.:format'
end
