Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  root 'articles#index'

  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
