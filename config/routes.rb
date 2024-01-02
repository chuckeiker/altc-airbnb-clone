Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get "listings/search", to: "listings#search"
    resources :users, only: [:create, :update, :show]
    resource :session, only: [:show, :create, :destroy]
    resources :listings, only: [:index, :create, :update, :show, :destroy]
    resources :reservations, only: [:index, :create, :update, :destroy]
    resources :reviews, only: [:index, :create, :update, :destroy]
  end


  get '*path', to: "static_pages#frontend_index" 
end
