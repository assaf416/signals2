class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :feed_id
      t.datetime :published_at
      t.string :channel
      t.string :title
      t.string :link
      t.string :author
      t.text :message
      t.string :image_url
      t.string :guid
      t.string :symbol

      t.timestamps
    end
    add_index :articles, :feed_id
    add_index :articles, :channel
    add_index :articles, :title
    add_index :articles, :link
    add_index :articles, :guid
    add_index :articles, :symbol
    add_index :articles, :author
  end
end
