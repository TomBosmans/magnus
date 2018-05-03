Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: %w[index]
  end

  # Everything in here uses controller public/*
  # but the url does not include public
  scope module: :public do
  end
end
