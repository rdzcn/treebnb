class Tree < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :price_per_night, presence: true, numericality: true
  validates :capacity, presence: true, numericality: true
  # validates :location, presence: true
  validates :address, presence: true
  validates :title, presence: true



 # mount_uploader :photo, PhotoUploader
 has_attachments :photos, maximum: 3

 geocoded_by :address
 after_validation :geocode, if: :will_save_change_to_address?


  # search: min and max latidue & longitude
  scope :by_longitude, -> (min, max) { min && max ? where('longitude >= :min AND longitude <= :max', min: min, max: max) : all }
  scope :by_latitude, -> (min, max) { min && max ? where('latitude >= :min AND latitude <= :max', min: min, max: max) : all }

  API_RESULTS_LIMIT = 100

  def self.search(min_lat:, max_lat:, min_lng:, max_lng:)
    by_latitude(min_lat, max_lat).
    by_longitude(min_lng, max_lng).
    limit(API_RESULTS_LIMIT)
  end


end
