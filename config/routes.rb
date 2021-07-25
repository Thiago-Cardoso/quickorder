Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :categories
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
