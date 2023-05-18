# frozen_string_literal: true

Rails.application.routes.draw do
  resources :mags do
    collection { post :import }
  end
  root to: 'mags#index'
end
