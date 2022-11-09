class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :homes
  

  validates :score, presence: true

   def self.search(search_review)
       Review.where(["instrument_name like?", "%#{search_review[:search_instrument_name]}%"])
   end

end
