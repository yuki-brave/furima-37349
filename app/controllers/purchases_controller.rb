class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def new
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :shipping_prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    ).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp::Charge.create(
      card: purchase_params[:token],
      amount: @item.price,
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @item.purchase.present? || @item.user_id == current_user.id
  end
end
