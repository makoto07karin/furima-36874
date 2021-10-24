class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :category_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item,          presence: true
  validates :price,         presence: true, numericality: { with: /\A[0-9]+\z/, message: "can't be Half-width number", only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true}
  validates :item_state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_info,     presence: true
  validates :image,         presence: true
 

  # Association
  has_one :order 
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery
  belongs_to :shipping
  belongs_to :area

end
