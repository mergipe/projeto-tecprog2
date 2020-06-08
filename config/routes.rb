Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'custom_sessions' }

  resources :users do
    resources :alimentos, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :dias, only: [:index, :show]
  end

  resources :alimentos, only: [:index, :show]

  get 'alimentos/:id/delete', to: 'alimentos#delete', as: 'delete_alimento'

  root 'dias#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
