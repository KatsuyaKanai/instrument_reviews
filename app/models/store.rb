class Store < ApplicationRecord
  has_one_attached :image

  has_many :reviews, dependent: :destroy
  belongs_to :user, optional: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :nearest_station, presence: true

  ransacker :reviews_count do
    query = '(SELECT COUNT(reviews.id) From reviews where reviews.store_id = stores.id GROUP BY reviews.store_id)'
    Arel.sql(query)
  end

  ransacker :reviews_avg_score do
    query = '(SELECT AVG(reviews.score) From reviews where reviews.store_id = stores.id GROUP BY reviews.store_id)'
    Arel.sql(query)
  end

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def reviews_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
