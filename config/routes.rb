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
    patch "/task/:id/achieve" => "tasks#achieve", as: "achieve"
    resources :tasks, except: [:index, :show]
    resources :subjects, except: [:index, :show]
    resources :post_study_methods do
      resources :comments
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
