class OrderAddresse
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order, :post_code, :city, :house_number, :building_numberty, :tel, :area_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,                    numericality: { with: /\A[0-9]+\z/}
    validates :city
    validates :house_number,                numericality: { with: /\A[0-9]+\z/}
    validates :building_numberty
    validates :tel,                         numericality: { with: /\A[0-9]+\z/}
    validates :area_id,                     numericality: { other_than: 0 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Addresse.create(order_id: order.id, post_code: post_code, city: city, house_number: house_number, cibuilding_numberty: cibuilding_numberty,tel: tel, area_id: area_id)
  end
end