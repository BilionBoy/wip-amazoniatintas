Rails.application.routes.draw do
  resources :l_segmentos
  root 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  
  get  'home/index'
  get  'store/index'
  
  resources :l_tipo_usuarios
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
