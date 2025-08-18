class Admin::StoresController < Admin::BaseController
  def index
    @stores = Store.includes(:user, :tags, :category).order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @store = Store.find(params[:id])
    @comments = @store.comments.includes(:user).order(created_at: :asc).page(params[:page]).per(5)
  end

  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @stores = Store.where("name LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(5)
    else
      @stores = Store.none
      flash.now[:alert]="検索結果がありません"
      render :search
    end 
  end

  def destroy
    @store = Store.find(params[:id])
    if @store.destroy
      redirect_to admin_stores_path, notice:"削除できました"
    else
      render :show, alert: "削除に失敗しました"
    end 
  end 
end
