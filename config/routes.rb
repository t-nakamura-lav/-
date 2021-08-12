Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:show, :edit, :update]

  # member= resourcesでは自動生成されないものに使う。生成するroutingに:idがつく。
  # collection= resourcesでは自動生成されないものに使う。生成するroutingに:idがつかない。
  resources :tweets do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]

    member do
      get 'to_log'
    end

    collection do
      get 'complete'
    end
  end
  # post=URLが保存不可、get=URL保存可

end
