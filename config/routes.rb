Rails.application.routes.draw do
  resources :days

  root to: 'days#index'
end
