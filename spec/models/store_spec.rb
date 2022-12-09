require 'rails_helper'

RSpec.describe Store, type: :model do

  describe "stores#create" do
    it "店名がない場合無効である" do
      store = FactoryBot.build(:store, name: nil)
      store.valid?
      expect(store.errors[:name]).to include("を入力してください")
    end

    it "都道府県がない場合無効である" do
      store = FactoryBot.build(:store, address: nil)
      store.valid?
      expect(store.errors[:address]).to include("を入力してください")
    end

    it "最寄駅がない場合無効である" do
      store = FactoryBot.build(:store, nearest_station: nil)
      store.valid?
      expect(store.errors[:nearest_station]).to include("を入力してください")
    end
  end
end
