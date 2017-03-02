Rails.application.routes.draw do
  resources :questions, only: [:index, :show]
  resources :answers, only: :create

  root to: 'home#index'
end
