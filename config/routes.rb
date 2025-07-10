Rails.application.routes.draw do
  #管理者用
  devise_for :admins, controllers:{
    sessions: 'admin/sessions'
  }

  #ユーザー用
  scope module: :public do
    root to: 'homes#top'
    get 'homes/top'
    get 'about' => 'homes#about'
    devise_for :users, controllers:{
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
  end
end
