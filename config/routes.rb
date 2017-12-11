Rails.application.routes.draw do
  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create]
  get 'downgrade' => 'charges#downgrade', as: :downgrade
  
  
  devise_for :users
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end