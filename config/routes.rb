Rails.application.routes.draw do
  namespace :user do
    get 'inquiries/show'
  end
  namespace :admin do
    get 'inquiries/index'
    get 'inquiries/show'
    get 'inquiries/edit'
  end
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
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"

  }

  namespace :admin do
    get "/" => "menus#index"
    resources :menus, only: [:show, :edit, :create, :update, :destroy]
    resources :shops, only: [:show, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end