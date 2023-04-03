Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: 'homes#top'
    resources :menu, only: [:index, :show]
    resources :shop, only: [:show]
    resources :inquiries, only: [:new, :create]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"

  }

  namespace :admin do
    get "/" => "menus#index"
    resources :menus, only: [:new, :show, :edit, :create, :update, :destroy]
    resources :shops, only: [:index, :edit, :create, :update]
    resources :inquiries, only: [:index, :show, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end