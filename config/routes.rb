Rails.application.routes.draw do
  get 'collaborators/index'

  resources :wikis
  resources :charges, only: [:new, :create]
  get 'downgrade' => 'charges#downgrade', as: :downgrade
  
  
  devise_for :users
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end