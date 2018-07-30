class Api::V1::UsersController < ApplicationController
  before_action :requires_user, only: [:show]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])

    #Get the token for authentication
    token = get_token()

    render json: @user, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

  def destroy
    find_user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:user_id, :username, :email, :password, :profile_pic, :bio, :single, :created_at, :updated_at)
  end

end
