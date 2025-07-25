class Public::UsersController < Public::BaseController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def mypage 
    @user = current_user
    @stores = @user.stores.order(created_at: :desc)  #マイページでの投稿一覧用
  end 

  def show 
    @user = User.find(params[:id])
    @stores = @user.stores.order(created_at: :desc)
  end 

  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @users = User.where("name LIKE ?", "%#{@keyword}%")
    else
      @users = User.none
      flash.now[:alert] = "検索結果がありません"
      render :search
    end 
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: 'プロフィールを更新しました'
    else 
      render :edit
    end 
  end 

  def destroy
    current_user.destroy
    reset_session
    redirect_to new_user_registration_path, notice: '退会しました'
  end 


  private

  def user_params
    params.require(:user).permit(:name,:email)
  end 

  def correct_user 
    user = User.find(params[:id])
    unless current_user == user 
      redirect_to mypage_path, alert: '権限がありません'
    end 
  end 

end
