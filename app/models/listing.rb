class Listing < ApplicationRecord
    validates :host_id, presence: true
    validates :address, presence: true
    validates :title, presence: true
    validates :description, presence: true
    validates :num_beds, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :num_bedrooms, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :number_bathrooms, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :has_ac, inclusion: { in: [true, false] }
    validates :has_wifi, inclusion: { in: [true, false] }
    validates :has_pets_allowed, inclusion: { in: [true, false] }
    validates :has_washer_dryer, inclusion: { in: [true, false] }
    validates :latitude, presence: true, numericality: true
    validates :longitude, presence: true, numericality: true

    belongs_to :host, class_name: 'User', foreign_key: 'host_id'
    has_many_attached :photos
    has_many :reviews, class_name: 'Review', foreign_key: 'listing_id'

end
