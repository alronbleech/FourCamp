class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.integer :season_name, null: false, default: 0
      t.timestamps
    end
  end
end
