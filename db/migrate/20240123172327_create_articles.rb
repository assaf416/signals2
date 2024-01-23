class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :feed_id
      t.string :title
      t.text :message
      t.string :guid
      t.string :symbol

      t.timestamps
    end
    add_index :articles, :feed_id
    add_index :articles, :title
    add_index :articles, :guid
    add_index :articles, :symbol
  end
end
