class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :uid
      t.string :name
      t.string :symbol
      t.string :sector
      t.string :insdustry
      t.string :country
      t.float :pnl

      t.timestamps
    end
    add_index :companies, :uid
    add_index :companies, :name
    add_index :companies, :symbol
    add_index :companies, :sector
    add_index :companies, :insdustry
  end
end
