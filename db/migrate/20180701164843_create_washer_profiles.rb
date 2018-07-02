class CreateWasherProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :washer_profiles do |t|
      t.references :user, foreign_key: true
      t.string :dni_photo
      t.integer :dni_id
      t.string :phone_number

      t.timestamps
    end
  end
end
