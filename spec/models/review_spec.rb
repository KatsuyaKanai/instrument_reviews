require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "reviews#create" do
    it "タイトルがない場合無効である" do
      review = FactoryBot.build(:review, reviews_title: nil)
      review.valid?
      expect(review.errors[:reviews_title]).to include("を入力してください")
    end

    it "楽器名がない場合無効である" do
      review = FactoryBot.build(:review, instrument_name: nil)
      review.valid?
      expect(review.errors[:instrument_name]).to include("を入力してください")
    end

    it "料金がない場合無効である" do
      review = FactoryBot.build(:review, store_price: nil)
      review.valid?
      expect(review.errors[:store_price]).to include("を入力してください")
    end

    it "星評価がない場合無効である" do
      review = FactoryBot.build(:review, score: nil)
      review.valid?
      expect(review.errors[:score]).to include("を入力してください")
    end

    it "レビューがない場合無効である" do
      review = FactoryBot.build(:review, store_reviews: nil)
      review.valid?
      expect(review.errors[:store_reviews]).to include("を入力してください")
    end
  end
  describe "楽器名検索" do
    it "楽器名の検索ができること" do
    end

    it "楽器名検索で違う楽器が検索できないこと" do
    end
  end
end
