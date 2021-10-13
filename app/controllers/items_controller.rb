class ItemsController < ApplicationController
  def index
    
  end

  #def show
    
  #end

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