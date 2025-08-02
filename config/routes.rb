Rails.application.routes.draw do

  #管理者ログイン用（devise）
  devise_for :admins, path: 'admin', controllers:{
    sessions: 'admin/sessions'
  }

  #ユーザー用ログイン
  devise_for :users, controllers:{
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  #管理者用リソース
  namespace :admin do
    resources :stores, only: [:index, :show, :destroy] do 
      collection do 
        get 'search'
      end 
    end 

    resources :users, only: [:index, :show] do 
      collection do
        get 'search'
      end 
    end

    resources :comments, only: [:index]
    resources :tags, only: [:index, :create, :destroy]
    resources :categories, only: [:index, :create, :destroy]
    root to: 'homes#top'
  end

 

  #ユーザー用
  scope module: :public do
    #ルート
    root to: 'homes#top'

    get 'about' => 'homes#about'
    get 'mypage', to: 'users#mypage', as: 'mypage'


    #ユーザー編集・更新・退会・検索
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do 
        get 'search'
      end 
    end 
    
    #投稿機能、コメント、検索
    resources :stores do 
      resources :comments, only: [:create, :destroy]
      collection do 
        get 'search'
      end 
    end 
  end
end
