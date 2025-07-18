class Public::HomesController < Public::BaseController

  #ゲストログインするまでに必要なアクションのため許可
  skip_before_action :authenticate_user!, only: [:top,:about]

  def top
  end

  def about
  end 
end
