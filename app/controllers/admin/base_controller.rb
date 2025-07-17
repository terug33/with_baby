class Admin::BaseController < ApplicationController

  #管理者かどうかチェック
  before_action :authenticate_admin!

  layout 'admin'
end