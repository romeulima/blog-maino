class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ "index", "show" ]
  before_action :set_post, only: [ "show", "edit", "update", "destroy" ]

  before_action :authorize_user!, only: [ "edit", "update", "destroy" ]


  def index
    @posts = Post.active.order(created_at: :desc).page(params[:page]).per(3).includes(:tags)
  end

  def user_posts
    user = User.find_by(id: params[:user_id])
    return redirect_to root_path, alert: t("not_found") unless user

    @posts = user.posts.active.order(created_at: :desc).page(params[:page]).per(3).includes(:tags)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end


  def update
    @post = Post.find_by(id: params[:id])
    return redirect_to root_path, alert: t("not_found") unless @post.present?

    if @post.update(post_params.except(:tags))
      @post.update_post_tags(post_params[:tags])
      redirect_to @post, notice: t(".success")
    else
      flash.now[:notice] = t(".error")
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!


    redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed."
  end

  def create
    @post = current_user.posts.build(post_params.except(:tags))
    @post.add_tags(post_params[:tags])

    if @post.save
      redirect_to @post, notice: t(".success")
      UserMailer.with(user: current_user).welcome_message.deliver_later
    else
      flash.now[:alert] = t(".error")
      render "new", status: :unprocessable_entity
    end
  end

  def upload
    file = params[:file]

    return redirect_to new_post_path, alert: t(".empty") if file.blank?
    return redirect_to new_post_path, alert: t(".invalid") unless file.content_type == "text/plain"

    content = file.read

    if Post.file_valid_format?(content)
      CreatePostFromFileJob.perform_async(content, current_user.id)
      redirect_to root_path, notice: t(".success")
    else
      redirect_to new_post_path, alert: t(".invalid")
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    return redirect_to root_path, alert: t("not_found") unless @post.present?

    @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end

  protected

  def authorize_user!
    unless @post.user == current_user
      redirect_to root_path, alert: t("unauthorized")
    end
  end
end
