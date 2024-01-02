# app/views/reservations/show.json.jbuilder
json.extract! @reservation,
    :id,
    :listing_id,
    :guest_id,
    :num_guests,
    :total_price,
    :start_date,
    :end_date

json.listing do
    json.extract! @reservation.listing,
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

    json.photos @reservation.listing.photos do |photo|
        json.photo_url url_for(photo)
    end
end
