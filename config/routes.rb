require 'sidekiq/web'
Rails.application.routes.draw do

  root 'disruptions#home'

  resources :disruptions

  mount Sidekiq::Web => '/sidekiq'

end
