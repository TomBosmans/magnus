Rails.application.routes.draw do
  namespace :admin do
    root to: 'dashboard#index'
    resources :dashboard, only: %w[index]
    resources :articles, except: [:index]

    resources :groups, only: %w[show] do
      resources :articles, only: [:new, :create]
    end
  end

  # Everything in here uses controller public/*
  # but the url does not include public
  scope module: :public do
  end
end
