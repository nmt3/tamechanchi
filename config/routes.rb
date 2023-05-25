Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: 'homes#top'
    resources :menus, only: [:index, :show]
    resources :shops, only: [:index]
    resources :inquiries, only: [:new, :create] do
      collection do
        get :thanks
      end
    end
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"

  }

  namespace :admin do
    get "/" => "shops#index"
    resources :menus, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :genres, only:[:index, :edit, :create, :update, :destroy]
    resources :shops, only: [:new, :edit, :create, :update]
    resources :inquiries, only: [:index, :show, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end