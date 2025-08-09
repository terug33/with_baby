class Public::CategoriesController < Public::BaseController
  
  def show
    @categories = Category.all.order(:name)
    @category = Category.find(params[:id])
    @stores = @category.stores.order(created_at: :desc)
  end 
end
