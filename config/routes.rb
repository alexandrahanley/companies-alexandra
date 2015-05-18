Rails.application.routes.draw do
  root "welcome#index"

  resources :industries
  resources :companies


end
