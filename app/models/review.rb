class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :homes
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :score, presence: true

  def self.search(search_review)
      Review.where(["address like? OR name like?", "%#{search_review[:search_reviews_keyword]}%", "%#{search_review[:search_reviews_keyword]}%"])
            .where(["instrument_name like?", "%#{search_review[:search_reviews_instrument_name]}%"])
    
  end
end
