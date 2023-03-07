require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, -> (u) { u.admin? } do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  root 'vacations#index'
  resources :vacations do
    resources :off_times
  end
end
