class Api::V1::HeadsController < ApplicationController
  # before_action :authenticate, only: [:create]


  def index
    @heads = Head.all
    render json: @heads, status: 200
  end

  def show
    find_head
    @url = Rails.application.routes.url_helpers.rails_blob_path(@head.url, only_path: true)
    render json: @head, status: 200
  end

  def new
    @head = Head.new
  end

  def create
    @upload = head_params['url']
    @user_id = head_params['user_id']

    @head = Head.create(user_id: @user_id, url: @upload)

    # @file_name = SecureRandom.uuid
    # @file_path = "./public/#{@file_name}.png"
    # File.open(@file_path, 'wb') { |file| file.write(Base64.decode64(@upload)) }

    # byebug

    # # creds = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    # s3 = AWS::S3::Resource.new(region:'us-east-1')
    # obj = s3.bucket('monster-mash').object(@file_name)
    # obj.upload_file(@file_path, { acl: 'public-read' })
    
    @head = Head.create(user_id: @user_id, url: @file_path)
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
