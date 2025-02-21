Rails.application.routes.draw do
  # Defines the root path route ("/")
  # => (/)スラッシュはホームを表示。それがrootに対応する。
  # root "posts#index"
  root "static_pages#home"

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"


  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  
end
