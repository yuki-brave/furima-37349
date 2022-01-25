class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_cost, :shipping_prefecture_id, :shipping_days_id

  belongs_to :user
  has_one_attached :image
  has_one :purchase, dependent: :destroy

  with_options presence: true do
  validates :title, :text, :image, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は設定金額内の値を入力してください' }
  end
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_prefecture_id, :shipping_days_id,
  numericality: { other_than: 1, message: 'を選択してください' }
end
