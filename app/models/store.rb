class Store < ApplicationRecord

  has_many :reviews
  belongs_to :user, optional: true

  # ransacker :avg_score do
  #   query = '(SELECT COUNT(reviews.score / reviews.id) From reviews where reviews.store_id = stores.id GROUP BY reviews.store_id)'
  #   Arel.sql(query)
  # end

  ransacker :reviews_count do
    query = '(SELECT COUNT(reviews.id) From reviews where reviews.store_id = stores.id GROUP BY reviews.store_id)'
    Arel.sql(query)
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  def reviews_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

  def self.search(search_store)
    Store.where(["name like? OR address like?", "%#{search_store[:search_word]}%", "%#{search_store[:search_word]}%"])
  end
end
