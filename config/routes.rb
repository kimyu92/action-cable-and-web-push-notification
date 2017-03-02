Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :questions, only: [:index, :show]
  resources :answers, only: :create

  root to: 'home#index'
end
