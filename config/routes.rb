require "sidekiq/web"

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  authenticate :user, lambda {|user|user.admin?} do
  mount Sidekiq::Web => "/sidekiq"
  end
end
