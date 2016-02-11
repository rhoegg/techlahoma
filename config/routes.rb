Techlahoma::Application.routes.draw do

  use_doorkeeper
  get "oauth/me" => "oauth/users#me"

  get "user_group/index"
  scope path: '/buzz', controller: :buzz do
    get "/" => :index
    get "updatethevariousblogs" => :updatethevariousblogs
  end

  scope path: '/community', controller: :community do
    get "/" => :index
    get "/codeofconduct" => :codeofconduct
    get "/contributors" => :contributors
  end

  scope path: '/groups', controller: :user_group do
    get "/" => :index
    get "/index" => :index
  end


  get "profile" => "profile#index", :as => :profile
  get "sessions/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "signin" => "sessions#new", :as => :signin
  get "signout" => "sessions#destroy", :as => :signout
  match "/auth/:provider/callback" => "sessions#create", :via => [:get, :post]
  get '/auth/failure' => "sessions#omniauth_failure"

  resources :authentications, :only => [:destroy]


  namespace "api" do#, :path => "", :constraints => {:subdomain => ["api", "stageapi"]}, :default => {:format => :json} do
    get "/" => "docs#index"
      scope path: '/blog', controller: :blog do
        get '/feed' => :feed
      end
      
      scope path: '/groups', controller: :groups do
        get '/' => :list_groups
        get '/:id' => :show_group
      end
      
  end # namespace api

  root 'buzz#index'
end
