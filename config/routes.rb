Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :alimentos, only: [:index, :new, :edit, :create, :update, :destroy]
    get 'alimentos/:id/delete', to: 'alimentos#delete', as: 'delete_alimento'
    resources :refeicoes
    get 'refeicoes/:id/delete', to: 'refeicoes#delete', as: 'delete_refeicao'
  end

  resources :alimentos, only: [:index, :show]

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
