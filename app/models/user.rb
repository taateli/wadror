class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
            length: { minimum: 3, maximum: 15 }
  validate :password_complexity
  def password_complexity
    if password.present? and not password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d){4,}.+\z/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
  has_secure_password

  has_many :ratings, dependent: :destroy   # käyttäjällä on monta ratingia
end