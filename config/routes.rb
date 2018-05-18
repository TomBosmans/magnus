Rails.application.routes.draw do
  namespace :admin do
    root to: 'dashboard#index'
    resources :settings, only: [:show, :edit, :update]
    resources :dashboard, only: %w[index]

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
