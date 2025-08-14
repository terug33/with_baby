class Admin::CommentsController < Admin::BaseController

  def index
    @comments = Comment.includes(:user, :store).order(created_at: :desc).page(params[:page]).per(5)
  end
end
