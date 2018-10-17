class Api::V1::AuthController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if(@user && @user.authenticate(params[:password]))
      render json: {
        user_details: @user,
        token: gen_token(),
        status: 201
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def get_user
    token = get_token()
    token_info = decode_token()
    userid = token_info[0]['sub']

    @user = User.find_by(id: userid)
    if(@user)
      render json: {
        user_details: @user,
        status: 200
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unauthorized
    end
  end
end
