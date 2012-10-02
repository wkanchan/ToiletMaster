# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  toilet_id  :integer
#  clean      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  content    :string(255)
#

class Review < ActiveRecord::Base
  attr_accessible :clean, :content, :toilet_id # removed :user_id
  #attr_readonly :user_id

  validates :content,   presence: true, length: {maximum: 140}
  validates :user_id,   presence: true
  validates :clean,     presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :toilet_id, presence: true

  belongs_to :toilet
  belongs_to :user

  default_scope order: 'reviews.created_at DESC'
end
