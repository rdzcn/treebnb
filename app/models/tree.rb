class Tree < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :price_per_night, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  # validates :location, presence: true
  validates :address, presence: true


 # mount_uploader :photo, PhotoUploader
  has_attachments :photos, maximum: 10

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
