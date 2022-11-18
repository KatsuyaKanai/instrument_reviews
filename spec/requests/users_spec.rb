require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ユーザの新規登録"
    it "名前、メールアドレス、パスワードがある場合有効である" do
      user = User.new(
        name: "testman",
        email: "testman@example.com",
        password: "testmanpassword"
      )
      expect(user).to be_valid
    end

    it "名前がない場合無効である" do
      user = User.new(
        name: nil,
        email: "testman@example.com",
        password: "testmanpassword"
      )
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  it "メールアドレスがない場合無効である"
  it "重複したメールアドレスの場合無効である"
  it "パスワードがない場合無効である"
end
