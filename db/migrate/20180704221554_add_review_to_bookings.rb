class AddReviewToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :rating, :float
  end
end
