class Rating < ActiveRecord::Base
  belongs_to :beer

  def to_s
    olut = Beer.find self.beer
    nimi = olut.name
    arvostelu = self.score
    return "#{nimi} " + "#{arvostelu}"
  end
end
