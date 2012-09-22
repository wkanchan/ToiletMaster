class Toilet < ActiveRecord::Base
  # this creates getters & setters
  attr_accessible :latitude, :longitude, :name

  # 1 toilet has many reviews
  has_many :reviews

  def url_to_google_maps
    "http://maps.google.com/maps?q=#{self.latitude},#{self.longitude}&num=1&t=m&z=17"
  end
end
