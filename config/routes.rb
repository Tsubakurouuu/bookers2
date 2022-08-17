Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users

  resources :books
  resources :users, only: [:index, :edit, :show, :update]

  get "home/about" => "home#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
