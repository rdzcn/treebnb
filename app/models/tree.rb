class Tree < ApplicationRecord
  belongs_to :user
  validates :price_per_night, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  validates :location, presence: true
end
