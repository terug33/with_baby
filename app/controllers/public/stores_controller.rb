class Public::StoresController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def correct_user 
    @store = Store.find(params[:id])
    unless @store.user == current_user
      redirect_to stores_path, alert:"権限がありません"
    end 
  end 

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def search 
    @keyword = params[:keyword]
    if @keyword.present?
      @stores = Store.where("name LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
    else 
      @stores = Store.none
    end 
  end 

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.build(store_params)
    if @store.save 
      redirect_to @store, notice:"保存できました"
    else 
      render :new 
    end 
  end 

  def edit
    @store = Store.find(params[:id])
  end

  def update 
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to @store, notice:"更新できました"
    else 
      render :edit 
    end 
  end 

  def destroy 
    @store = Store.find(params[:id])
    @store.destroy 
    redirect_to stores_path, notice:"削除できました"
  end 


  private

  def store_params
    params.require(:store).permit(:name, :description, :score, :address, :zip_code, :latitude, :longitude)
  end 
end
