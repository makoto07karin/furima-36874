Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items/index'
  root to: "items#index"

  resources :items, only: [:index,:show]
end
