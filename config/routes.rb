Rails.application.routes.draw do
  root to: 'statistic#metrics'

  resources :employees
  resources :issues
  resources :tags
  resources :state_issues
  resources :priority_issues
  resources :type_issues
  resources :projects
  devise_for :users

  get 'metrics', to: 'statistic#metrics'
  resources :users, except: :destroy
end
