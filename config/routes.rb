Rails.application.routes.draw do
  root "welcome#index"

  resources :industries do
    resources :companies
  end
  
end
