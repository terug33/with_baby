class Admin::StoresController < Admin::BaseController
  def index
  end

  def show
    @store = Store.find(params[:id])
  end

  def search
  end

  def destroy
    @store = Store.find(params[:id])
    if @store.destroy
      redirect_to admin_root_path, notice:"削除できました"
    else
      render :show, alert: "削除に失敗しました"
    end 
  end 
end
