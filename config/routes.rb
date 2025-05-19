Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :l_tipo_usuarios

  root 'home#index'

  get 'home/index'
  get 'store/index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
