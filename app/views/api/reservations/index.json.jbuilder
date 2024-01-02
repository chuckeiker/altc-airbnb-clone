@reservations.each do  |reservation| 
    json.set! reservation.id do
        json.extract! reservation, 
            :id,
            :listing_id,
            :guest_id,
            :num_guests,
            :total_price,
            :start_date,
            :end_date
            
    # Include the associated listing details
        json.listing do
            json.extract! reservation.listing, 
                :id,
                :address,
                :title,
                :description,
                :num_beds,
                :num_bedrooms,
                :number_bathrooms,
                :price,
                :has_ac,
                :has_wifi,
                :has_pets_allowed,
                :has_washer_dryer,
                :latitude,
                :longitude
            json.photos reservation.listing.photos do |photo|
                json.photo_url url_for(photo)
            end
        end

        
        if reservation.review.present?
            json.reviews do
                json.extract! reservation.review, 
                    :id,
                    :listing_id,
                    :reviewer_id,
                    :reservation_id,
                    :cleanliness,
                    :accuracy,
                    :value,
                    :communication,
                    :check_in,
                    :location,
                    :rating,
                    :body
            end
        end
    end
end