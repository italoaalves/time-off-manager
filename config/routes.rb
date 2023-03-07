require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, -> (u) { u.admin? } do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  root 'vacations#index'
  resources :vacations, only: [:index] do
    resources :off_times, only: [:new, :create, :destroy]
  end

  devise_for :users
end
