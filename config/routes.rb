Rails.application.routes.draw do
  namespace :api do
    resources :days
  end

  resources :days

  root to: 'days#index'
end
