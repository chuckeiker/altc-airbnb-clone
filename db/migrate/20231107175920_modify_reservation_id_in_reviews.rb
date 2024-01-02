class ModifyReservationIdInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :reservation_id, :bigint, null: false
  end
end
