class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id: params[:id])
    return redirect_to root_path, alert: t(".not_found") unless @tag.present?
    @posts = @tag.posts.active.order(created_at: :desc).page(params[:page]).per(3)
  end

  def search
    return redirect_to root_path, alert: t(".empty_search") if params[:tag].blank?

    @tag = params[:tag]

    @posts = Post.joins(:tags).where("tags.name ILIKE ?", "%#{@tag}%").active.order(created_at: :desc).page(params[:page]).per(3)

    return render :show if @posts.any?

    redirect_to root_path, alert: t(".not_found", tag: params[:tag])
  end
end
