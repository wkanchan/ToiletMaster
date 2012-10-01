# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # makes :name,:email accessible -- prevent vulnerability
  attr_accessible :email, :name, :password, :password_confirmation
  # from secure_password.rb -- makes :password_digest encrypt password automatically
  has_secure_password

  # a callback to force convert email to lowercase before save
  before_save { |user| user.email = email.downcase }

  # :name must not be blank or whitespace & length <= 50
  validates :name,  presence: true, length: {maximum: 50}

  # :email must not be blank or whitespace and valid with regex and unique in DB
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false } # ensure that case-insensitive

  # :password must be presence with minimum 6 chars
  validates :password, presence: true, length: { minimum: 6 }

  # :password_confirmation must be presence
  validates :password_confirmation, presence: true

end
