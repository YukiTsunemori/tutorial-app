Rails.application.routes.draw do
  get "users/new"
  # Defines the root path route ("/")
  # => (/)スラッシュはホームを表示。それがrootに対応する。
  # root "posts#index"
  root "static_pages#home"
  get "/help",    to: "static_pages#help"
  get "/about",   to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "signup", to: "users#new"
  resources :users
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
