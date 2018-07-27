class Api::V1::HeadsController < ApplicationController

  def index
    @heads = Head.all
    render json: @heads, status: 200
  end

  def show
    find_head
    render json: @heads, status: 200
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

  private

  def find_head
    @head = Head.find(params[:id])
  end

  def head_params
    # params.permit()
  end

end