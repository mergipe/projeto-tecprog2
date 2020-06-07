Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :users do
    resources :alimentos, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  resources :alimentos, only: [:index, :show]

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
