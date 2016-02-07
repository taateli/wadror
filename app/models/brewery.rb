class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, uniqueness: true,
            format: { without: /\s/ },
            length: { minimum: 1}

  validates :year, numericality: { greater_than_or_equal_to: 1024,
                                    less_than_or_equal_to: 2016,
                                    only_integer: true }

  def to_s
    return "#{self.name}"
  end
end
