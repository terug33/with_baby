class Admin::HomesController < Admin::BaseController
  def top
    @stores = Store.order(created_at: :desc).limit(3)
  end
end
