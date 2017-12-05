Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create, :downgrade]
  
  
  devise_for :users
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end