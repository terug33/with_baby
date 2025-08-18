class Admin::CommentsController < Admin::BaseController

  def index
    @comments = Comment.includes(:user, :store).order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    store = Store.find(params[:store_id])
    comment = store.comments.find(params[:id])
    if comment.destroy
      redirect_to admin_store_path(store), notice: "コメントを削除しました"
    else
      redirect_to admin_store_path(store), alert: "コメントの削除に失敗しました"
    end
  end
end
