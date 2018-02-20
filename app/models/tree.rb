class Tree < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :price_per_night, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  validates :location, presence: true

 # mount_uploader :photo, PhotoUploader
  has_attachments :photos, maximum: 10
end
