class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, numericality: { only_integer: true }
end
