require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品の出品' do
  context "商品の出品ができる場合" do
    it "商品画像を1枚、商品名、商品の説明、カテゴリーの情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格についての情報があれば保存できる" do
      expect(@item).to be_valid
    end
  end
  context "商品の出品ができない場合" do
    it "商品画像が空では投稿できない" do
      @item.image = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end     
    it "商品名が空では投稿できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end     
    it "商品の説明が空では投稿できない" do
      @item.describe = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Describe can't be blank")
    end     
    it "カテゴリーの情報が空では投稿できない" do
      @item.genre_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre can't be blank")
    end     
    it "商品の状態が空では投稿できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end     
    it "配送料が空では投稿できない" do
      @item.ship_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("ShipFee can't be blank")
    end     
    it "発送元の地域が空では投稿できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end     
    it "発送までの日数が空では投稿できない" do
      @item.ship_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("ShipDay can't be blank")
    end     
    it "販売価格が空では投稿できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end     
    it "販売価格は半角数字でなければ投稿できない" do
      @item.price = "１２３４"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end    
  end
end
end 
