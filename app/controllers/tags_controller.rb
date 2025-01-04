class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id: params[:id])
    return redirect_to root_path, alert: t(".not_found") unless @tag.present?
    @posts = @tag.posts.active.order(created_at: :desc).page(params[:page]).per(3)
  end

  def search
    return redirect_to root_path, alert: t(".empty_search") if params[:tag].blank?
    @tag = Tag.find_by(name: params[:tag].downcase)

    if @tag
      @posts = @tag.posts.active.order(created_at: :desc).page(params[:page]).per(3)
      return render :show if @posts.any?
    end
    redirect_to root_path, alert: t(".not_found", tag: params[:tag])
  end
end
