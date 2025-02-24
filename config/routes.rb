Rails.application.routes.draw do
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

  # resources :usersで、自動で生成されるルーティング機能は以下の通り。
  # get "/users" => "users#index"          #ユーザー一覧画面を生成
  # get "/users/:id" => "users#show"       #個別ユーザー詳細画面を生成
  # get "/users/new" => "users#new"        #新規ユーザー登録画面を生成
  # post "/users" => "users#create"        #新規ユーザー登録画面からの入力を受けて登録処理
  # get "/users/:id/edit" => "users#edit"  #既存ユーザー編集画面を生成
  # patch "/users/:id" => "users#update"   #編集画面からの入力を受けて更新処理
  # put "/users/:id" => "users#update"     #編集画面からの入力を受けて更新処理
  # delete "/users/:id" => "users#destroy" #一覧画面で選択されたデータを削除処理
end
