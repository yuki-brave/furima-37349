class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @purchase_destination = PurchaseDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :shipping_prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
