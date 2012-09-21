class Toilet < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  has_many :reviews
end
