Rails.application.routes.draw do
  get 'items/index'
  root "items#index"   # ルートを items#index にする
  resources :items
end