# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :mags do
      collection { post :import }
    end
    root to: 'mags#index'
  end
end
