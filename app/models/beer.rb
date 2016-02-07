class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  validates :name, uniqueness: true,
            format: { without: /\s/ },
            length: { minimum: 1}


  def to_s
    "#{name} #{brewery.name}"
  end
end
