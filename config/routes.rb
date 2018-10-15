require 'subdomain_constraint'
require 'routes_helper'
include RoutesHelper

Rails.application.routes.draw do
  constraints SubdomainConstraint do
    root to: 'admin/dashboard#index'

    devise_for :users

    namespace :admin do
      resource :password, only: [:edit, :update]

      resources :dashboard, only: [:index]
      resources :users, only: [:index, :new, :create, :destroy]
      resources_content only: [:show], module: 'groups'
      resources :groups, only: [:show] do
        resources_content except: [:index], module: 'groups'
      end

      admin_root_path = 'dashboard#index'
      root to: admin_root_path
      return_non_existing_paths to: admin_root_path
    end

    namespace :api do
      namespace :v1 do
        resources :groups, only: [:show, :index]
        resources_content only: [:show, :index]
      end
    end
  end

  # Everything in here uses controller public/*
  # but the url does not include public
  scope module: :public do
    resources :welcome, only: [:index]
  end

  root to: 'public/welcome#index'
end
