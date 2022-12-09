class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :reviews_title, presence: true
  validates :instrument_name, presence: true
  validates :store_price, presence: true
  validates :score, presence: true
  validates :store_reviews, presence: true

  def self.search(search_review)
    Review.where(["instrument_name like?", "%#{search_review[:search_instrument_name]}%"])
  end

  
end
