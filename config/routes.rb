Rails.application.routes.draw do
  default_url_options :only_path => true

  namespace :api do
    resources :days do
      collection do
        post 'commit'
      end
    end
  end

  resources :days

  root to: 'days#index'
end
