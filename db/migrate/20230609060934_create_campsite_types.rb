class CreateCampsiteTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :campsite_types do |t|
      t.string :type_name, null: false
      t.timestamps
    end
  end
end
