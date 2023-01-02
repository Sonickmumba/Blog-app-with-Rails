class CommentsController < ApplicationController
  def new
    @comment = Comment.new.includes(:author, :comments, :likes)
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_comments_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: 'Comment not created, try again!!'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
