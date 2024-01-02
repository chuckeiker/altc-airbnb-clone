class Reservation < ApplicationRecord

    belongs_to :listing
    belongs_to :guest, class_name: 'User'
    has_one :review, class_name: 'Review'
    
    validates :num_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :total_price, presence: true, numericality: { greater_than: 0 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :end_date_after_start_date

    private

    def end_date_after_start_date
        if start_date && end_date && start_date >= end_date
        errors.add(:end_date, "must be after the start date")
        end
    end

end
