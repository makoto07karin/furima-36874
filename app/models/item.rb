class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :category_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item,          presence: true
  validates :price,         presence: true, numericality: { with: /\A[0-9]+\z/, message: "can't be Half-width number"}#3
  validates :item_state_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user,          presence: true
  validates :item_info,     presence: true
  validates :image,         presence: true#2


  # Association
  has_one :order 
  has_one_attached :image#1
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery
  belongs_to :shipping
  belongs_to :area

end
#presence: trueは空欄ではdbに保存できくするための記述

#1ここで繋げてるからItemテーブルにImageカラムはなくてOK！
#そして、ストロングパラメーターで記述すればOK!permitのとこ
#なぜが、アソシエーションで繋がっているから！

#2イメージにもバリデーションをかける！Half-width number

#3 今回は数字を扱っているのでformatではなくnumericalityを使用していく！
#3更にdeviseの時とは異なりメッセージは自分で記述できるのでアレンジが可能！