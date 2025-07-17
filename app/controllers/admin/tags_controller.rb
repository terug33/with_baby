class Admin::TagsController < Admin::BaseController
  def index 
    @tags = Tag.all
    @tag = Tag.new
  end 

  def create 
    @tag = Tag.new(tag_params)
    if @tag.save 
      redirect_to admin_tags_path, notice: 'タグを作成しました'
    else 
      @tags = Tag.all   #エラー時に一覧を再表示するために必要
      render :index 
    end 
  end 

  
  private

  def tag_params
    params.require(:tag).permit(:name)
  end 
end
