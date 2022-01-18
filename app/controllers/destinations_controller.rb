class DestinationsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # @destination = Destination.new
  end
end
