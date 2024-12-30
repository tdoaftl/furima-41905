require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user) 
    @item = FactoryBot.create(:item, user: @user)
    @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it '正しく全部存在すれば保存できる' do   
        expect(@buy_delivery).to be_valid
      end
      it '建物名がなくても保存できる' do
        @buy_delivery.building = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '保存できない場合' do
      it 'カード番号が空だと保存できない' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '有効期限が空だと保存できない' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'セキュリティコードが空だと保存できない' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @buy_delivery.postcode = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が半角数字ではないと保存できない' do
        @buy_delivery.postcode = '１２３-４５６７'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode is invalid. Enter it as follows(e.g. 123-4567)")
      end
      it '郵便番号のハイフンが正しい位置にないと保存できない' do
        @buy_delivery.postcode = '1234-567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode is invalid. Enter it as follows(e.g. 123-4567)")
      end
      it '郵便番号のハイフンがないと保存できない' do
        @buy_delivery.postcode = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postcode is invalid. Enter it as follows(e.g. 123-4567)")
      end
      it '都道府県が選択されてないと保存できない' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @buy_delivery.city = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @buy_delivery.phonenumber = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @buy_delivery.phonenumber = '090123456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phonenumber is too short")
      end
      it '電話番号が半角数字ではないと保存できない' do
        @buy_delivery.phonenumber = '０９０１２３４５６７８'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phonenumber is invalid. Input only number")
      end
      it 'userが紐付いていないと保存できない' do
        @buy_delivery.user_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buy_delivery.item_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end