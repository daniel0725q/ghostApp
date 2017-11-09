Rails.application.routes.draw do
  resources :reports
  resources :expenditures
  resources :incomes
  resources :groups
  get 'reports', to: 'reports#index'
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
