class Beer < ActiveRecord::Base


  belongs_to :brewery
  has_many :ratings, dependent: :destroy

def average_rating
  arvostelut = Rating.where beer_id: self.id
  pisteet = 0.0
  arvostelut.each do |arvostelu|
    pisteet += arvostelu.score
  end

  keskiarvo = pisteet/arvostelut.count
  ratinki = 'rating'.pluralize(arvostelut.count)
  return "Has #{arvostelut.count} #{ratinki}, average #{keskiarvo.round(1)}"
end

def to_s
  panimo = Brewery.find self.brewery_id
  return "#{self.name}, #{panimo.name}"
end

end
