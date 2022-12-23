class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
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
      render :new, alert: ':( Post not created, enter again :('
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
