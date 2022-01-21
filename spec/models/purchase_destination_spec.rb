require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.id = '1'
    @user.save
    @item = FactoryBot.build(:item)
    @item.id = '1'
    @item.save
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: @user.id, item_id: @item.id)
    sleep 0.05
  end

  describe '商品購入' do
    context '商品の購入が可能な場合' do
      it '全ての項目の入力が存在すれば、購入できること' do
        expect(@purchase_destination).to be_valid
      end
      it 'buildingが空でも購入できること' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
    end
    context '商品の購入ができない場合' do
      it 'post_codeが空では購入できない' do
        @purchase_destination.post_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが全角数字では購入できない' do
        @purchase_destination.post_code = '１２３-４５６７'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが半角のハイフンを含んだ形式では購入できない' do
        @purchase_destination.post_code = '1111111'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_prefecture_idが空では購入できない' do
        @purchase_destination.shipping_prefecture_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it 'shipping_prefecture_idが「---」では購入できない' do
        @purchase_destination.shipping_prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_destination.address = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字では購入できない' do
        @purchase_destination.phone_number = '１２３４５６７８９０１'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9個以下の半角数字では購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12個以上の半角数字では購入できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では購入できない' do
        @purchase_destination.token = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いてなければ購入できない' do
        @purchase_destination.user_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いてなければ購入できない' do
        @purchase_destination.item_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
