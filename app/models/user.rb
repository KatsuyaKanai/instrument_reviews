class User < ApplicationRecord
  has_many :homes
  has_many :reviews
  has_many :stores

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guestuser@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'ゲストユーザー'
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
