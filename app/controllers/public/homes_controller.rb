class Public::HomesController < Public::BaseController

  #ゲストログインするまでに必要なアクションのため許可
  skip_before_action :authenticate_user!, only: [:top,:about]

  def top
    @stores = Store.order(created_at: :desc).limit(3)
    @categories = Category.all.order(:name)
  end

  def about
  end 
end
