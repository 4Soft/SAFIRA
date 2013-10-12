# -*- encoding : utf-8 -*-
SIG::Application.routes.draw do


  resources :cashiers do
    resources :releases
  end

  resources :reports, only: [:index]

  get "help" => "help#show"

  resources :entrepreneurs , controller: :human_resources, as: :human_resources

  devise_for :users, :controllers => {:confirmations => 'confirmations'}

  get "users/dashboard" => "users#dashboard"

  get "/feedbacks" => "feedback#show"

  devise_scope :user do
    root :to => "devise/sessions#new"
    put "/confirm" => "confirmations#confirm"
  end
   
  resources :selection_processes do 
    get "/register/" => "sp_register#show_process", as: :register_form
    post "/register/" => "sp_register#register", as: :register_candidate

    get "/success/" => "sp_register#successful_register", as: :successful_register
    
    get "/confirm_register/" => "sp_register#confirm_register", as: :confirm_register

    post "/consolidate" => "selection_processes#consolidate_process", as: :consolidate

    resources :candidates, except: [:create, :new]

    resources :process_steps do
      post "/feedback/:cand_id" => "feedback#eval_candidate", as: :eval_candidate
      put "/feedback/:cand_id" => "feedback#update_eval_candidate", as: :eval_candidate

      post "/consolidate" => "process_steps#consolidate_step", as: :consolidate
    end
  end

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
end
