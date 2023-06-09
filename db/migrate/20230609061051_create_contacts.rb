class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :member_id, foreign_key: true, null: false
      t.string :subject, null: false
      t.text :demand, null: false
      t.integer :supported_status, null: false, default: 0
      t.timestamps
    end
  end
end
