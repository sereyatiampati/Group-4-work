Rails.application.routes.draw do
  resources :animals, only: [:index, :create, :destroy, :update, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
