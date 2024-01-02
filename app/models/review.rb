class Review < ApplicationRecord

    belongs_to :listing, class_name: 'Listing', foreign_key: 'listing_id'
    belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'
    belongs_to :reservation, class_name: 'Reservation', foreign_key: 'reservation_id'

    validates :listing_id, presence: true
    validates :reviewer_id, presence: true
    validates :reservation_id, presence: true
    validates :cleanliness, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :accuracy, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :communication, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :check_in, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :location, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :rating, presence: true

end
