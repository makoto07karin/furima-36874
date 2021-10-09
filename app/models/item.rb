class Item < ApplicationRecord
  validates :category_id,   presence: true
  validates :item,          presence: true
  validates :price,         presence: true
  validates :item_state_id, presence: true
  validates :delivery_id,   presence: true 
  validates :area_id,       presence: true
  validates :shipping_id,   presence: true
  validates :user,          presence: true
  validates :item_info,     presence: true

  # Association
  belongs_to :user
  has_one :order 
  has_one_attached :image
end
#presence: trueは空欄ではdbに保存できくするための記述