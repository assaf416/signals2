class CreateTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :tickers do |t|
      t.string :symbol
      t.string :exchange
      t.string :name
      t.text :description
      t.string :market
      t.float :last_price
      t.datetime :last_price_at
      t.float :last_change_percent
      t.float :ask_size
      t.float :bid_size
      t.float :ask_price
      t.float :bid_price
      t.string :sector
      t.string :industry
      t.string :kind
      t.date :next_report_date
      t.text :info
      t.text :news
      t.text :daily_candles
      t.text :m1_candles
      t.text :m5_candles
      t.text :d1_candles

      t.timestamps
    end
    add_index :tickers, :symbol
    add_index :tickers, :name
    add_index :tickers, :last_price_at
    add_index :tickers, :sector
    add_index :tickers, :industry
    add_index :tickers, :kind
    add_index :tickers, :market
    add_index :tickers, :exchange
  end
end
