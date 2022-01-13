class Item < ApplicationRecord
  validates :title, :text, :price, presence: true

  belongs_to :user
end
