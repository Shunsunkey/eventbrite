Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  get 'messages/create'

  devise_for :users
  root 'static_pages#index'
  delete 'users/sign_out', to: 'devise/sessions#destroy'
  resources :events, only: [:show, :new, :create]
  resources :messages, only: [:new, :create]
  resources :contacts, only: [:new], path: '/contact', controller: 'static_pages'
  resources :users do
    member do
      get 'profile'
    end
  end
end
