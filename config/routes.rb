Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboard#index'
    resources :settings, only: [:show, :edit, :update]
    resources :users, only: [:index]
    resources :dashboard, only: [:index]

    Content.types.each do |klass|
      resources klass.to_s.underscore, controller: 'contents',
                                       type: klass.to_s,
                                       except: [:index, :new, :create]
    end

    resources :groups, only: %w[show] do
      Content.types.each do |klass|
        resources klass.to_s.underscore, controller: 'contents',
                                         type: klass.to_s,
                                         only: [:new, :create]
      end
    end
  end

  # Everything in here uses controller public/*
  # but the url does not include public
  scope module: :public do
  end
end
