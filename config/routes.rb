Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homepage", to: "users#index"
  root "home#index"
  get "/stream", to: "home#stream"
  resources :users

end
