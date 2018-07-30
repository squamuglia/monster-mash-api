class Api::V1::HandsController < ApplicationController

  def index
    @hands = Hand.all
    @hands.map do |hand| 
        if (hand.image.attachment)
          hand['url'] = Rails.application.routes.url_helpers.rails_blob_path(hand.image, only_path: true)
      end
    end
    render json: @hands, status: 200
  end

  def show
    find_hand
    if @hand.image
      @url = Rails.application.routes.url_helpers.rails_blob_path(@hand.image, only_path: true)
      @hand['url'] = @url
    end
    render json: @head, status: 200
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
    params.permit(:user_id, :url)
  end

end