<%=app_name%>::Application.routes.draw do
  resources :roles do
    get 'page/:page', :action => :index, :on => :collection
    delete 'delete/all', :action => :destroy_all, :on => :collection
  end
  resources :<%=plural_name%> do
    resources :roles
    get 'page/:page', :action => :index, :on => :collection
    delete 'delete/all', :action => :destroy_all, :on => :collection
  end

  root :to => "home#index"

  get 'login' => 'login#index'
  post 'login' => 'login#new'
  get 'logout' => 'login#logout'
end
