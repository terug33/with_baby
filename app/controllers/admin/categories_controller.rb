class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @stores = @category.stores.order(created_at: :desc).page(params[:page]).per(5)
  end 

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'カテゴリーを作成しました'
    else 
      @categories = Category.all
      render :index
    end 
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path, notice: 'カテゴリーを削除しました'
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end 

end
