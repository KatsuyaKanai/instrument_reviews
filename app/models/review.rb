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

  #review#indexのソート機能
  # def self.sort(selection)
  #   case selection
  #   when 'new'
  #     return all.order(updated_at: :DESC)
  #   when 'old'
  #     return all.order(updated_at: :ASC)
  #   when 'high_scores'
  #     return all.order(score: :DESC)
  #   when 'low_scores'
  #     return all.order(score: :ASC)
  #   end
  # end
    

end
