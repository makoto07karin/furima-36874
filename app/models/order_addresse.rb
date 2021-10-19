class OrderAddresse
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order, :post_code, :city, :house_number, :building_numberty, :tel, :area_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,                   format:       {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :house_number
    validates :tel,                         format:       { with: /\A\d{10}\z/,with: /\A\d{11}\z/}
    validates :area_id,                     numericality: { other_than: 0 }
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Addresse.create(order_id: order.id, post_code: post_code, city: city, house_number: house_number, building_numberty: building_numberty,tel: tel, area_id: area_id)
  end
end