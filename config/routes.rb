Rails.application.routes.draw do
  namespace :admin do
    get 'stores/index'
    get 'stores/show'
    get 'stores/search'
  end
  namespace :public do
    get 'stores/index'
    get 'stores/show'
    get 'stores/new'
    get 'stores/edit'
  end
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
