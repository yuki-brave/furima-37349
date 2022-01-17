class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_cost, :shipping_prefecture_id, :shipping_days_id

  belongs_to :user
  has_one_attached :image

  validates :title, :text, :image, presence: true
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_prefecture_id, :shipping_days_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { presence: true, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # validates :price, numericality: {presence: true, only_integer: true, in: 300..9999999 }
  # , format:  {with: /\A[0-9]+\z/ } # 全て数値（半角）
end
