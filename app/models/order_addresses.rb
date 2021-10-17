class OrderAddersses
  include ActiveModel::module
  attr_accessor :user_id, :item_id, :order, :post_code, :city, :house_number, :building_numberty, :tel, :area_id

  with_options presence: true do
    :user_id
    :item_id
    :post_code,                   numericality: { with: /\A[0-9]+\z/}
    :city
    :house_number,                numericality: { with: /\A[0-9]+\z/}
    :building_numberty
    :tel,true,                    numericality: { with: /\A[0-9]+\z/}
    :area_id,                     numericality: { other_than: 0 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Addresse.create(order_id: order.id, post_code: post_code, city: city, house_number: house_number, cibuilding_numberty: cibuilding_numberty,tel: tel, area_id: area_id)
  end
end