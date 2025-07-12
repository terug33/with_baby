class Public::StoresController < ApplicationController

  before_acition :authenticate_user!
  before_acition :correct_user, only[:edit, :update, :destroy]

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

  def edit
    @store = Store.find(params[:id])
  end

  def update 
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to @store, notice:"更新できました"
  end 

  def destroy 
    @store = Store.find(params[:id])
    @store.destroy 
    redirect_to stores_path, notice:"削除できました"
  end 

  def store_params
    params.require(:store).permit(:name, :description, :score, :address, :zip_code, :latitude, :longitude)
  end 
end
