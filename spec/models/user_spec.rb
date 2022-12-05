require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  describe "ユーザの新規登録"
    it "名前、メールアドレス、パスワードがある場合有効である" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    #⬆︎一つ上と同じテスト？

    it "名前がない場合無効である" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    
    it "メールアドレスがない場合無効である" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスの場合無効である" do
      FactoryBot.create(:user, email: "testman@example.com" )
      user = FactoryBot.build(:user, email: "testman@example.com" )
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがない場合無効である" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが5文字以下の場合、無効である" do
      user = FactoryBot.build(:user, password: 12345)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "パスワードが確認用パスワードと一致しない場合、無効である" do
      user = FactoryBot.build(:user, password_confirmation: "testmanpassword123")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
