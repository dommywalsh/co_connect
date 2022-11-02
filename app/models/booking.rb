class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  enum status: [:pending, :confirmed, :rejected]
end
