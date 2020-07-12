Rails.application.routes.draw do
  default_url_options :only_path => true

  namespace :api do
    resources :days
  end

  resources :days

  root to: 'days#index'
end
