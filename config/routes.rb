Rails.application.routes.draw do
  devise_for :users
  resource :favorites, only: %i[create destroy]
  root to: "searches#index"
  resource :search, only: %i[index show]
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
