Rails.application.routes.draw do
  resources :companies
  resources :feeds
  resources :articles
  resources :filters
  resources :candles
  resources :tickers
  get 'home/news'
  get 'home/stocks'
  get 'home/indexes'
  get 'home/filters'
  get 'home/signals'
  get 'home/today'
  get 'home/patterns'
  get 'home/technicals'
  namespace :home do
    get 'managers/index'
  end
  
  mount RailsPerformance::Engine, at: "rails/performance"
  mount ActiveStorageDB::Engine, at: "active_storage_db"
  

  devise_for :users
  resources :users do
    get "logout"
  end
  root "users#index"
end
