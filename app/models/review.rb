class Review < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search_review)
      Review.where(["address like?", "%#{search_review[:search_reviews_address]}%"])
            #.where(["name like?", "%#{search_reviews_params[:search_name]}%"])
            #.where(["instrument_name like?", "%#{search_rerview_params[:search_instrument_name]}%"])
    
  end
end
