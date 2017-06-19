class Shoe < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  has_many :buyer, through: :purchases, source: :user
  has_many :purchases
end
