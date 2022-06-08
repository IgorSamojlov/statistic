Rails.application.routes.draw do
  resources :employees
  resources :issues
  resources :tags
  resources :state_issues
  resources :priority_issues
  resources :type_issues
  resources :projects
  devise_for :users

  resources :users, except: :destroy
end
