class Api::V1::SignupController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def register
    @users = User.create(user_params)
    if @users.save
      render json: @users, status: :created
    else
      render json: { status: 'ERROR', message: 'User Not Created' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :bio, :photo, :password, :posts_counter, :role)
  end
end
