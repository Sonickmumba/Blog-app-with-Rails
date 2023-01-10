class PostsController < ApplicationController
  # before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find_by(id: params[:user_id])
    @post = @author.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: ':( Post not created, enter again please :('
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @user.decrement!(:posts_counter)
    @post.destroy
    if @post.destroy
      redirect_to user_posts_path, notice: 'Post deleted successfully'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
