# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  reviewer   :string(255)
#  toilet_id  :integer
#  detail     :string(255)
#  clean      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :clean, :detail, :reviewer, :toilet_id
  validates :detail, :length => {:maximum => 140}
  validates :reviewer, :length => {:maximum => 20}

  belongs_to :toilet
end
