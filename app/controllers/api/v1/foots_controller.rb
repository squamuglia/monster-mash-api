class Api::V1::FootsController < ApplicationController
  before_action :authenticate, only: [:create]


  def index
    @foots = Foot.all
    render json: @foots, status: 200
  end

  def show
    find_foot
    @url = Rails.application.routes.url_helpers.rails_blob_path(@foot.image, only_path: true)
    @foot['url'] = @url
    render json: @foot, status: 200
  end

  def new
    @foot = Foot.new
  end

  def create
    @foot = Foot.create(foot_params)
    render json: @foot, status: 201
  end

  def destroy
    find_foot.destroy
  end

  private

  def find_foot
    @foot = Foot.find(params[:id])
  end

  def foot_params
    params.permit(:user_id, :url)
  end

end
