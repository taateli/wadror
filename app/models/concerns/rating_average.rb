module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
     avgrating = ratings.inject(0.0){ |sum, r| sum+r.score } / ratings.count
     avgrating.round(2)
  end
end