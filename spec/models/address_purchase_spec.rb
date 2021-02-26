require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    item = FactoryBot.create(:item)
    sleep 0.5
    user = FactoryBot.create(:user)
    @address_purchase = FactoryBot.build(:address_purchase, item_id: item.id, user_id: user.id)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it '全ての値を正しく入力されていれば保存できること' do
        expect(@address_purchase).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @address_purchase.building = nil
        expect(@address_purchase).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it 'post_numberが空だと保存できないこと' do
        @address_purchase.post_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post number can't be blank")
      end

      it 'prefectureを選択してないと保存できないこと' do
        @address_purchase.prefecture_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureで0を選択された場合は保存できない' do
        @address_purchase.prefecture_id = 0
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityはからでは保存できないこと' do
        @address_purchase.city = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'streetはからでは保存できないこと' do
        @address_purchase.street = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Street can't be blank")
      end

      it 'phoneは空では保存できない' do
        @address_purchase.phone = '0809876787'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number Input only number")
      end

      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @address_purchase.post_number = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end

      it 'post_numberが半角のハイフンを含んだ3桁-4桁でないと保存できない' do
        @address_purchase.post_number = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end

      it 'phoneは十一桁の数値のみでしか保存できない' do
        @address_purchase.phone = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone can't be blank", "Phone number Input only number")
      end

      it 'phoneはハイフンは無しでないと保存できない' do
        @address_purchase.phone = '0728-1234-5678'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number Input only number")
      end

      it 'tokenがからでは登録できないこと' do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "ユーザーが紐付いていなければ投稿できない" do
        @address_purchase.user_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("User can't be blank")
      end

      it "商品が紐付いていなければ投稿できない" do
        @address_purchase.item_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
