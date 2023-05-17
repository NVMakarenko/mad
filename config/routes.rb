# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'magnetometers/index'
  resources :locations do
    collection { post  :import }
  end
  resources :magnetometers do
    collection { post  :import }
  end
  root to: 'locations#index'
end
