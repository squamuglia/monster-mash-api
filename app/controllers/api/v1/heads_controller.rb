class Api::V1::HeadsController < ApplicationController
  before_action :authenticate, only: [:create]


  def index
    @heads = Head.all
    @heads.map do |head|
        if (head.image.attachment)
          head['url'] = Rails.application.routes.url_helpers.rails_blob_path(head.image, only_path: true)
      end
    end
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
    @head = Head.create(head_params)
    render json: @head, status: 201
  end

  def destroy
    find_head.destroy
  end

  def logo
    send_file 'public/headlogo.png', type: 'image/png', disposition: 'inline'
  end

  private

  def find_head
    @head = Head.find(params[:id])
  end

  def head_params
    params.permit(:user_id, :url, :username)
  end

end
