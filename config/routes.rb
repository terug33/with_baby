Rails.application.routes.draw do
  namespace :admin do
    #管理者ログイン用（devise）
    devise_for :admins, controllers:{
      sessions: 'admin/sessions'
    }

    resources :stores, only: [:index, :show, :destroy] do 
      collection do 
        get 'search'
      end 
    end 
  end

 

  #ユーザー用
  scope module: :public do
    #ユーザー用ログイン
    devise_for :users, controllers:{
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

    #ルート
    root to: 'homes#top'

    #アバウトページ
    get 'about' => 'homes#about'
    
    #投稿機能
    resources :stores do 
      collection do 
        get 'search'
      end 
    end 
  end
end
