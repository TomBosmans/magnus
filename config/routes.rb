Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: %w(index)
  end
end
