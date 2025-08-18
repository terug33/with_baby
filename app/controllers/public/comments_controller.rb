class Public::CommentsController < Public::BaseController

  def create 
    @store = Store.find(params[:store_id])
    @comment = @store.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save 
      redirect_to store_path(@store), notice: 'コメントを投稿しました'
    else 
      redirect_to store_path(@store), alert: "コメントに失敗しました"
    end 
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @store = @comment.store 
    if @comment.user == current_user
      @comment.destroy
      redirect_to store_path(@store), notice: 'コメントを削除しました'
    else
      redirect_to store_params(@store), alert: '削除権限がありません'
    end 
  end 


  private

  def comment_params
    params.require(:comment).permit(:content)
  end 
end
