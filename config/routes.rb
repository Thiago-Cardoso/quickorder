Rails.application.routes.draw do
  resource :product_orders
  get 'cart', to: 'cart#show'
  devise_for :employees do
    get '/employees/sign_out' => 'devise/sessions#destroy'
    get '/employees/reset_password'
  end

  get 'home', to: 'home#index'
  get 'dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :categories
    resources :employees
  end

  resources :orders
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
