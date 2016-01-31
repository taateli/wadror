class Brewery < ActiveRecord::Base


  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def average_rating
    arvostelut = Rating.where beer_id: self.beers
    pisteet = 0.0
    arvostelut.each do |arvostelu|
      pisteet += arvostelu.score
    end

    keskiarvo = pisteet/arvostelut.count
    ratinki = 'rating'.pluralize(arvostelut.count)
    return "Has #{arvostelut.count} #{ratinki}, average #{keskiarvo.round(1)}"
  end

  def to_s
    return "#{self.name}"
  end
end
