class UsersController < ApplicationController
  has_many :bookings
  has_many :trees, through: :bookings
end
