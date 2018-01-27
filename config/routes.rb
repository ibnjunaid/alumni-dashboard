Rails.application.routes.draw do
  resources :regs
  resources :events
  devise_for :alumni,:controllers => { :registrations=> "registrations" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :alumni
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "alumni#index"
end
