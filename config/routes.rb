Rails.application.routes.draw do
  
  
  resources :lists do
    resources :tasks, shallow: true
    #get '/add-list/#' => 'lists#add_list', on: :member 
  end
  
  get '/add-list-tasks-logs' => 'lists#add_list_tasks_logs' 
  post '/add-list' => 'lists#add_list', as: 'add_list'
  #get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get '/move-task/:id' => 'tasks#move' , as: 'move-task'
  patch '/move-task-change' => 'tasks#move_task'
  get '/show-list-not-active' => 'lists#show_list_not_active'
  get '/show-task-not-active' => 'tasks#show_task_not_active'

  get '/change-lang/:locale' => 'profiles#change_lang'
  #resources :users
  #get '/from-login' => 'users#index'
  #post '/login' => 'users#login'
  #get '/home' => 'home#index'
  #get 'new' => 'users#new'
  #get 'logout' => 'users#logout'
  # Example of regular route:
   #get '/home/IN' => 'home#index' #, foo: 'bar'

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
