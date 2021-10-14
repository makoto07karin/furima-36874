class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @item = Item.order("created_at DESC")
  end

  def show
    
   @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  #def edit
    
  #end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :item, :price, :item_state_id, :delivery_id, :area_id, :shipping_id, :item_info, :image).merge(user_id: current_user.id)
  end
end  


