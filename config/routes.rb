Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:show, :edit, :update]

  resources :tweet_images, only: [:new, :create, :index, :show, :destroy]

  # member= resourcesでは自動生成されないものに使う。生成するroutingに:idがつく。
  # collection= resourcesでは自動生成されないものに使う。生成するroutingに:idがつかない。
  resources :tweets do
    member do
      get 'to_log'
    end

    collection do
      get 'complete'
    end
  end
  # post=URLが保存不可、get=URL保存可

end
