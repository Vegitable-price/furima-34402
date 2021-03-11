require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '商品画像を1枚、商品名、商品の説明、カテゴリーの情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格についての情報があれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it '商品画像が空では投稿できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では投稿できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報が空では投稿できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態が空では投稿できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料が空では投稿できない' do
        @item.ship_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("輸送費を入力してください", '輸送費を選択してください')
      end
      it '発送元の地域が空では投稿できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を入力してください")
      end
      it '発送までの日数が空では投稿できない' do
        @item.ship_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("輸送必要日数を入力してください", "輸送必要日数を選択してください")
      end
      it '販売価格が空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は不正な値です", "価格は数値で入力してください")
      end
      it '販売価格は半角数字でなければ投稿できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '販売価格に数字以外が混じっていると投稿できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'カテゴリーの情報が無効なidの場合投稿できない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態の情報が無効なidの場合投稿できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の情報が無効なidの場合投稿できない' do
        @item.ship_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('輸送費を選択してください')
      end
      it '発送元の情報が無効なidの場合投稿できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県を選択してください')
      end
      it '発送までの日数の情報が無効なidの場合投稿できない' do
        @item.ship_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('輸送必要日数を選択してください')
      end
      it 'priceは300以下の場合登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceは9,999,999以上の場合登録できない' do
        @item.price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
