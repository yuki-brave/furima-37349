class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_cost, :shipping_prefecture_id, :shipping_days_id


  belongs_to :user
  has_one_attached :image

  validates :title, :text, :price, presence: true
  validates :category_id, :condition_id, :shipping_cost_id,:shipping_prefecture_id, :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" } 

end
