class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_no
      t.string :kind
      t.string :role
      t.string :uid
      t.string :keepass
      t.boolean :manager
      t.boolean :employee

      t.timestamps
    end
    add_index :users, :phone_no
    add_index :users, :kind
    add_index :users, :role
    add_index :users, :uid
    add_index :users, :employee
  end
end
