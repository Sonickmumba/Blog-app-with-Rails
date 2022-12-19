class PostsController < ApplicationController
  def index
    render 'posts'
  end

  def show
    render 'show'
  end
end
