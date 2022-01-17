class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:item).permit(:title, :text, :price, :category_id, :condition_id, :shipping_cost_id, :shipping_prefecture_id,
                                 :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end
