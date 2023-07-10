class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id, foreign_key: true, null: false
      t.integer :campsite_id, foreign_key: true, null: false
      t.integer :season_id, foreign_key: true, null: false
      t.string :title, null:false
      t.float :star, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
