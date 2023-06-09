class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      t.integer :campsite_type_id, foreign_key: true, null: false
      t.integer :prefecture_id, foreign_key: true, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :phone_number, null: false
      t.string :route, null: false
      t.text :feature, null: false
      t.text :considerations, null: false
      t.timestamps
    end
  end
end
