Rails.application.routes.draw do
  devise_for :employees do
    get '/employees/sign_out' => 'devise/sessions#destroy'
    get '/employees/reset_password'
  end

  get 'dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :categories
    resources :employees
  end

  resources :orders do
    get :change_situation, on: :member
  end
  resources :kitchen_orders, only: [:index]
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
