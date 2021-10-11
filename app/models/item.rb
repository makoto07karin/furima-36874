class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :category_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item,          presence: true
  validates :price,         presence: true
  validates :item_state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user,          presence: true
  validates :item_info,     presence: true

  # Association
  has_one :order 
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :item_state_id
  belongs_to :delivery_id
  belongs_to :shipping_id
  belongs_to :area_id

end
#presence: trueは空欄ではdbに保存できくするための記述