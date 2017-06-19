class Shoe < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  has_one :buyer, through: :purchase, source: :user
  has_one :purchase
end
