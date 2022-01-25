class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :address, :user_id, :item_id, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不適切です。ハイフン「-」を含めてください' }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'を正しく入力してください' }
  end
  validates :shipping_prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, shipping_prefecture_id: shipping_prefecture_id, city: city, address: address,
                       building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
