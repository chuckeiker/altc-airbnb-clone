json.listing do
    json.extract! @listing, 
        :id,
        :host_id,
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
    json.photos @listing.photos do |photo|
        json.photo_url url_for(photo)
    end

    json.reviews @listing.reviews do |review|
        json.extract! review, 
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
            json.reviewer do
                json.first_name review.reviewer.first_name
                json.last_name review.reviewer.last_name
            end
    end

end

json.host do
    json.extract! @listing.host, 
    :id,
    :email,
    :first_name,
    :last_name
end

# json.reviews @listing.reviews do |review|
#     json.extract! review, 
#         :id,
#         :cleanliness,
#         :accuracy,
#         :value,
#         :communication,
#         :check_in,
#         :location,
#         :rating,
#         :body
# end