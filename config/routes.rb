Rails.application.routes.draw do
  devise_for :users
  root controller: :main, action: :index
  resources :sessions, only: [:index, :new]
  get '*path', to: 'main#index', via: :all
end
