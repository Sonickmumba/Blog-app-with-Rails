class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: 'Like not added, try again!!'
    end
  end
end
