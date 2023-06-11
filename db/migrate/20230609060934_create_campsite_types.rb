class CreateCampsiteTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :campsite_types do |t|
      t.integer :type_name, null: false, default: 0
      t.timestamps
    end
  end
end
