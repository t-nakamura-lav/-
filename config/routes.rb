Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :user_infos, only: [:show, :edit, :update]

  # member= resourcesでは自動生成されないものに使う。生成するroutingに:idがつく。
  # collection= resourcesでは自動生成されないものに使う。生成するroutingに:idがつかない。
  resources :tweets do
    member do
      post 'to_log'
    end

    collection do
      get 'complete'
    end
  end
  # post=URLが保存可、get=URL保存不可

end
