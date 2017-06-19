class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :first_name, :last_name
  validates :email, :uniqueness => { :case_sensitive => false }
  has_many :shoes
  has_many :shoes_purchased, through: :purchases, source: :shoe
  has_many :purchases
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
