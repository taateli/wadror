class Place
  include ActiveModel::Model

  attr_accessor :id, :name, :status, :reviewlink, :lat, :lng, :map, :altmap, :proxylink, :blogmap, :street, :city, :state, :zip, :country, :phone, :overall, :imagecount

  def self.rendered_fields
    [:id, :name, :status, :street, :city, :zip, :country, :overall, ]
  end



end