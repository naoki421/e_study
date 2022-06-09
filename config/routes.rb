Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: "public/homes#top"

  scope module: :public do
    resources :users, only: [:index, :show, :edit, :update]
    resources :subjects, except: [:index, :show]
    resources :tasks, except: [:index, :show] do
      resources :achieved_tasks, only: [:create]
    end
    resources :post_study_methods, except: [:new] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get "/achieved_tasks", to: "achieved_tasks#index"
    get "/favorites", to: "favorites#index"
    get "/search", to: "post_study_methods#search"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
