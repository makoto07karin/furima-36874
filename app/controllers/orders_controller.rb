class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
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
    params.require(:order_addresses).permit(:user, :item, :post_code, :city, :house_number, :building_numberty, :tel, :area_id).merge(user_id: current_user.id)
  end

end
