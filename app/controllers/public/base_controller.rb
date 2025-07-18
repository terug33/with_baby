class Public::BaseController < ApplicationController

  #ログインユーザーだけがアクセスできるようにする/ゲストログインまでに必要なアクションは個別に許可する
  before_action :authenticate_user!
end 