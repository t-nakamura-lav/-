Rails.application.routes.draw do
  devise_for :users
  # ゲストユーザーを削除できないようにする
  # , controllers: {
  #   registrations: 'users/registrations'
  # }
  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get 'homes/about'

  resources :contacts, only: [:new, :create] do
    collection do
      get 'done'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'search'
      get 'result'
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # member= resourcesでは自動生成されないものに使う。生成するroutingに:idがつく。
  # collection= resourcesでは自動生成されないものに使う。生成するroutingに:idがつかない。
  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]

    collection do
      get 'complete'
    end
  end
  # post=URLが保存不可、get=URL保存可

  resources :calendars, only: [:create, :index]
end
