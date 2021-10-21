require 'rails_helper'

RSpec.describe OrderAddresse, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_addresse = FactoryBot.build(:order_addresse,user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入情報の保存' do
    context '正常系' do
      it '全ての値が正しく入力されていれば保存できる' do
      end 
      
      it 'building_numbertyがなくても保存できる' do
      end 
    end

    context '異常系' do
      it 'post_codeがないと保存できない' do
        
        @order_addresse.post_code = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post code can't be blank")
      end 
      it 'post_codeはハイフンがないと保存できない' do
        @order_addresse.post_code = '1234567'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Post code is invalid")
      end
      it 'area_idがないと保存できない' do
        @order_addresse.area_id = '0'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Area must be other than 0")
      end
      it 'cityがないと保存できない' do
        @order_addresse.city = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberがないと保存できない' do
        @order_addresse.house_number = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("House number can't be blank")
      end
      it 'telがないと保存できない' do
        @order_addresse.tel = ''
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが10桁以上11桁以内の半角数値でないと保存できない' do
        @order_addresse.tel = '１２３４５６７８９０'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが９桁以下では保存できない' do
        @order_addresse.tel = '123456789'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが12桁以上では保存できない' do
        @order_addresse.tel ='1234567890123'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが半角数字以外が含まれると保存できない' do
        @order_addresse.tel = 'asdfghjklo'
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Tel is invalid")
      end
      it "tokenが空では保存できない" do
        @order_addresse.token = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていなければ購入できない' do
        @order_addresse.user_id = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @order_addresse.item_id = nil
        @order_addresse.valid?
        expect(@order_addresse.errors.full_messages).to include("Item can't be blank")
      end


    end
  end
end
