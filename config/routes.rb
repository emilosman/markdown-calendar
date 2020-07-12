Rails.application.routes.draw do
  default_url_options :host => "localhost:4000"

  namespace :api do
    resources :days
  end

  resources :days

  root to: 'days#index'
end
