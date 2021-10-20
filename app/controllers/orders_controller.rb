class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
   
    @order_addresse = OrderAddresse.new 
  end

  def create
    
    @order_addresse = OrderAddresse.new(order_params)
   
    if @order_addresse.valid?
      pay_item
      @order_addresse.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_addresse).permit(  :post_code, :city, :house_number, :building_numberty, :tel, :area_id).merge(user_id: current_user.id,item_id: @item.id, token: params[:token] )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy')
  end

end
