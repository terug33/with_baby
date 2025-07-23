class Public::UsersController < Public::BaseController
  before_action :authenticate_user!

  def mypage 
    @user = current_user
    @stores = @user.stores.order(created_at: :desc)  #マイページでの投稿一覧用
  end 

  def show 
    @user = User.find(params[:id])
    @stores = @user.stores.order(created_at: :desc)
  end 

  def search
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

end
