# frozen_string_literal: true

Rails.application.routes.draw do
  resources :locations do
    collection { post  :import }
  end
  root to: 'locations#index'
end
