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

  
end
