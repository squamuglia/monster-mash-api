class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    find_user
    render json: @user, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render json: @user, status: 201
  end

  def destroy
    find_user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    # params.permit()
  end

end