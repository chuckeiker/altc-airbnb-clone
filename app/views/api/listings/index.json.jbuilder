# json.listings do
@listings.each do  |listing| 
    json.set! listing.id do
        json.extract! listing, 
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
        json.photos listing.photos do |photo|
            json.photo_url url_for(photo)
        end
    end

    json.host do
        json.extract! listing.host, 
        :id,
        :email,
        :first_name,
        :last_name
    end
end
# end