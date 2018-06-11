require './lib/subdomain_constraint.rb'

Rails.application.routes.draw do
  constraints SubdomainConstraint do
    root to: 'admin/dashboard#index'

    devise_for :users

    namespace :admin do
      admin_root_path = 'dashboard#index'
      root to: admin_root_path
      # If a path does not exist we will return the user back to the admin root.
      match '*path', to: admin_root_path, via: :all

      resources :settings, only: [:show, :edit, :update]
      resources :dashboard, only: [:index]
      resources :users, only: [:index, :new, :create, :destroy] do
        resource :password, only: [:edit, :update]
      end

      Content.types.each do |klass|
        resources klass.to_s.underscore.gsub('/', '_'),
                  controller: 'contents',
                  type: klass.to_s,
                  except: [:index, :new, :create]
      end

      resources :groups, only: %w[show] do
        Content.types.each do |klass|
          resources klass.to_s.underscore.gsub('/', '_'),
                    controller: 'contents',
                    type: klass.to_s,
                    only: [:new, :create]
        end
      end
    end
  end

  # Everything in here uses controller public/*
  # but the url does not include public
  scope module: :public do
  end
end
