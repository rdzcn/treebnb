class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tree
  validates: date_check_in, presence: true
  validates: date_check_out, presence: true
end
