class API::V1::HandsController < ApplicationController

  def index
    @hands = Hand.all
    render json: @hands, status: 200
  end

  def show
    find_hand
    render json: @hands, status: 200
  end

  def new
    @hand = Hand.new
  end

  def create
    @hand = Hand.create(hand_params)
    render json: @hand, status: 201
  end

  def destroy
    find_hand.destroy
  end

  private

  def find_hand
    @hand = Hand.find(params[:id])
  end

  def hand_params
    # params.permit()
  end

end