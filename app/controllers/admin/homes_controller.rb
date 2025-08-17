class Admin::HomesController < Admin::BaseController

  skip_before_action :authenticate_admin!, only: [:top]

  def top
    @stores = Store.order(created_at: :desc).limit(3)
    @categories = Category.all.order(:name)
  end
end
