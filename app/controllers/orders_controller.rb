class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
   
    @order_addresse = OrderAddresse.new #今回はここに記述しているのでNEWはいらない
  end

  def create
    #binding.pry
    @order_addresse = OrderAddresse.new(order_params)
    if @order_addresse.valid?
      @order_addresse.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_addresse).permit(  :post_code, :city, :house_number, :building_numberty, :tel, :area_id).merge(user_id: current_user.id,item_id: @item.id )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
