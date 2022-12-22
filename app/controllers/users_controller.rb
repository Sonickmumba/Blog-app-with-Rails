class UsersController < ApplicationController
  def index
    render 'users'
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
