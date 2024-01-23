class CreateFilters < ActiveRecord::Migration[7.0]
  def change
    create_table :filters do |t|
      t.integer :user_id
      t.string :name
      t.text :price_conditions
      t.text :volume_conditions
      t.text :fundamental_conditions
      t.text :pattern_conditions
      t.text :indicator_conditions
      t.string :email_notification

      t.timestamps
    end
    add_index :filters, :user_id
    add_index :filters, :name
  end
end
