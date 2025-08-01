class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all.includes(:stores, :comments)
  end

  def show
    @user = User.find(params[:id])
    @stores = @user.stores.order(created_at: :desc).page(params[:stores_page]).per(3)
    @comments = @user.comments.order(created_at: :desc).includes(:store).page(params[:comments_page]).per(5)
  end 

  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @users = User.where("name LIKE ?", "%#{@keyword}%")
    else
      @users = User.none
      flash.now[:alert] = "該当するユーザーはいません"
      render :search
    end 
  end 
end
