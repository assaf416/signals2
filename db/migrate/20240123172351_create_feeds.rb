class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
    add_index :feeds, :url
  end
end
