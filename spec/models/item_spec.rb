require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)#1
  end

  describe '商品の情報を入力' do
    context do #正常系
      it 'imageとcategory_idとitemとpriceとitem_state_idとdelivery_idとarea_idとshipping_idとitem_infoが存在すると出品できる' do
        expect(@item).to be_valid
      end
    end

    context do#異常系
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'itemが空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'item_stateが空では登録できない' do
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it 'deliveryが空では登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'areaが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'shippingが空では登録できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end

      it 'iteminfoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'priceは半角数字でないと保存できない' do
        @item.price = '１'    #2
        @item.valid?          #3
        expect(@item.errors.full_messages).to include("Price can't be Half-width number")#4
      end
    end
  end
end

#1コンソールで調べたい時は最初にここから元の情報を入手
#2条件を入れる
#3条件が合っているか確認して
#4メッセージが正しく表示できているか！