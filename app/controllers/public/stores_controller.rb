class Public::StoresController < Public::BaseController

  before_action :set_store, only: [:show, :edit, :update, :destroy]  #「correct_user」には「@store = Store.find(params[:id])」が必要なので、before_actionの順序は「set_user」→「correct_user」
  before_action :correct_user, only: [:edit, :update, :destroy]     #投稿者本人でなければ編集と削除ができない仕様にするため


  def index
    @stores = Store.includes(:user, :tags, :category).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
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
    @categories = Category.all
    @tags = Tag.all
  end

  def create
    @store = current_user.stores.build(store_params)
    @tags = Tag.all                                   #保存が失敗して「render :new」の場合に必要
    @categories = Category.all                        #保存が失敗して「render :new」の場合に必要
    if @store.save 
      redirect_to @store, notice:"保存できました"
    else 
      render :new 
    end 
  end 

  def edit
    @categories = Category.all
    @tags = Tag.all
  end

  def update 
    @categories = Category.all                         #更新が失敗して「render :edit」の場合に必要
    @tags = Tag.all                                    #更新が失敗して「render :edit」の場合に必要
    if @store.update(store_params)
      redirect_to @store, notice:"更新できました"
    else 
      render :edit 
    end 
  end 

  def destroy 
    if @store.destroy 
      redirect_to mypage_path, notice:"削除できました"
    else 
      redirect_to stores_path, alert: "削除に失敗しました"
    end 
  end 


  private

  def set_store                         #後々これをbefore_actionでも使い、コードを整理する
    @store = Store.find(params[:id])
  end

  def correct_user 
    unless @store.user == current_user
      redirect_to stores_path, alert:"権限がありません"
    end 
  end 

  def store_params
    params.require(:store).permit(:name, :description, :score, :address, :zip_code, :latitude, :longitude, :category_id, images:[], tag_ids:[])
  end 
end
