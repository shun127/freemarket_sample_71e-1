require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "item_introductionがない場合は登録できないこと" do
      item = build(:item, item_introduction: "")
      item.valid?
      expect(item.errors[:item_introduction]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
   
    it "postage_payersがない場合は登録できないこと" do
      item = build(:item, postage_payers: "")
      item.valid?
      expect(item.errors[:postage_payers]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "preparation_periodがない場合は登録できないこと" do
      item = build(:item, preparation_period: "")
      item.valid?
      expect(item.errors[:preparation_period]).to include("を入力してください")
    end

    it "nameが41文字以上であれば登録できないこと" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
  
    it "nameが40文字以下では登録できること" do
      item = build(:item, name: "aaaaaaaaaaaaa")
      expect(item).to be_valid 
    end

    it "priceが300以下では登録できないこと" do
      item = build(:item, price: "300")
      item.valid?
      expect(item.errors[:price]).to include() 
    end

    it "priceが9999999以上では登録できないこと" do
      item = build(:item, price: "1000000")
      item.valid?
      expect(item.errors[:price]).to include() 
    end
    
    it "item_introductionが1000以上では登録できないこと" do
      item = build(:item, item_introduction: "1001")
      item.valid?
      expect(item.errors[:item_introduction]).to include() 
    end

    it "item_introductionが1000以下では登録できること" do
      item = build(:item, item_introduction: "1000")
      expect(item.errors[:item_introduction]).to include() 
    end
  end
end