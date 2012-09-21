class Review < ActiveRecord::Base
  attr_accessible :clean, :detail, :reviewer, :toilet_id
  validates :detail, :length => {:maximum => 140}
  validates :reviewer, :length => {:maximum => 20}

  belongs_to :toilet
end
