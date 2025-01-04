class CommentsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    return redirect_to root_path unless @post.persisted?

    comment = @post.comments.new(comments_params)

    if user_signed_in?
      comment.user = current_user
    end

    if comment.save
      redirect_to @post, notice: t(".success")
    else
      redirect_to @post, alert: t(".error")
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
