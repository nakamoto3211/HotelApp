Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/home'
  root to: "users#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users, :only => [:show, :edit, :update]
  resources :rooms


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
