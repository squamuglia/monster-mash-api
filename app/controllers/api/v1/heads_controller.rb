class Api::V1::HeadsController < ApplicationController
  # before_action :authenticate, only: [:create]


  def index
    @heads = Head.all
    render json: @heads, status: 200
  end

  def show
    find_head
    render json: @head, status: 200
  end

  def new
    @head = Head.new
  end

  def create
    @upload = head_params['url']
    @user_id = head_params['user_id']

    @file_path = "./public/#{SecureRandom.uuid}"

    File.open(@file_path, 'w') { |file| file.write(@upload) }
    
    @head = Head.create(user_id: @user_id, url: "/#{@file_path}")
    render json: @head, status: 201
  end

  def destroy
    find_head.destroy
  end

  private

  def find_head
    @head = Head.find(params[:id])
  end

  def head_params
    params.permit(:user_id, :url)
  end

end
