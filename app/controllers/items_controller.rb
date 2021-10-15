class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit, :show]
  before_action :set_item, only: [:show, :update]
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @item = Item.order("created_at DESC")
  end

  def show
    
   #@item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end 

  private

  def item_params
    params.require(:item).permit(:category_id, :item, :price, :item_state_id, :delivery_id, :area_id, :shipping_id, :item_info, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end  


