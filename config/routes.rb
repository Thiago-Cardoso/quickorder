Rails.application.routes.draw do
  #devise_for :employees, :controllers => { registrations: 'registrations' }
  devise_for :employees do
    get '/employees/sign_out' => 'devise/sessions#destroy'
  end
  get 'dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :categories
  end
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
