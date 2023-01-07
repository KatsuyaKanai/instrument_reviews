class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :genre, :content

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :genre, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
