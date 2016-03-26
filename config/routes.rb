RpcOpps::Application.routes.draw do
  root :to => 'welcome#index'

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "/signout", to: "sessions#destroy", :as => :signout
  
  get "opportunities", to: "opportunities#index", :as => :opportunities
  get "opportunities/:id", to: "opportunities#show"

  get "news", to: "welcome#news"

  resources :users, :only => [:show] do
    put :fetch_producer_id
  end

  resources :release_notes, :only => [:index, :new, :create]

  # get '/.well-known/acme-challenge/:id' => 'welcome#letsencrypt'
end
