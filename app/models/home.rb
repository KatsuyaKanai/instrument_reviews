class Home < ApplicationRecord
  belongs_to :user

  ransacker :reviews_avg_score do
    query = '(SELECT AVG(reviews.score) From reviews where reviews.store_id = stores.id GROUP BY reviews.store_id)'
    Arel.sql(query)
  end
end
