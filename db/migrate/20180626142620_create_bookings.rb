class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :status
      t.string :after_photo

      t.timestamps
    end
  end
end
