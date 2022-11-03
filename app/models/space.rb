class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :images

  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
              against: [ :name, :description ],
              using: {
                tsearch: { any_word: true }
                      }
end
