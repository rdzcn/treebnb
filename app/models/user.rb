class User < ApplicationRecord
  has_many :trees
  has_many :bookings
  has_many :trees, through: :bookings
  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attachment  :avatar, accept: [:jpg, :png, :gif]
  # has_attachments :photos, maximum: 10
end
