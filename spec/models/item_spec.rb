require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品' do
  context '出品できる場合' do
     it 'image、name、explain、category、condition、shipping、prefacture、day、priceが存在すれば出品できる' do   
      expect(@item).to be_valid
     end
   end
 context '出品できない場合' do
   it 'imageが空では出品できない' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
   end
   it 'nameが空では出品できない' do
     @item.name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Name can't be blank")
   end
   it 'explainが空では出品できない' do
     @item.explain = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Explain can't be blank")
   end
   it 'categoryが選択されていなければ出品できない' do
     @item.category_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Category can't be blank")
   end
   it 'conditionが選択されていなければ出品できない' do
     @item.condition_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Condition can't be blank")
   end
   it 'shippingが選択されていなければ出品できない' do
     @item.shipping_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Shipping can't be blank")
   end
   it 'prefectureが選択されていなければ出品できない' do
     @item.prefecture_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Prefecture can't be blank")
   end
   it 'dayが選択されていなければ出品できない' do
     @item.day_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Day can't be blank")
   end
   it 'priceが空では出品できない' do
     @item.price = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Price can't be blank")
   end
   it 'priceが全角では出品できない' do
     @item.price = '５０００'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end
   it 'priceが半角アルファベットでは出品できない' do
     @item.price = "hoge"
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end
   it 'priceが半角カナでは出品できない' do
     @item.price = "ﾎｹﾞﾎｹﾞ"
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end
   it 'priceが半角記号では出品できない' do
     @item.price = "-^@[;*<>_.]"
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
  end
   it 'priceが299以下では出品できない' do
     @item.price = 299
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end
   it 'priceが10000000以上では出品できない' do
     @item.price = 10000000
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end
   it '紐づくユーザーが存在しないと保存できない' do
     @item.user = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("User must exist")
   end
  end
 end
end
