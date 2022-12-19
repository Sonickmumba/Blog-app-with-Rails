class UsersController < ApplicationController
  def index
    render 'users'
  end

  def show
    render 'show'
  end
end
