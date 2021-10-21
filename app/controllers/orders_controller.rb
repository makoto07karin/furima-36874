class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
   
    @order_addresse = OrderAddresse.new 
  end

  def create
    #binding.pry
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

  def move_to_index
    #ログイン状態の場合でも、URLを直接入力して自身が出品していない,売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移する動画
    if current_user.id != @item.order
      redirect_to root_path
    #自分自身が出品した商品
    else @item.user.user_id != @item
      redirect_to root_path

    end
  end

end
