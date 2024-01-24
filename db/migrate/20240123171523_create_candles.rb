class CreateCandles < ActiveRecord::Migration[7.0]
  def change
    create_table :candles do |t|
      t.string :ticker
      t.string :size
      t.datetime :candle_time
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.float :volume
      t.float :wvap
      t.float :avg_vol_50
      t.float :avg_vol_100
      t.float :avg_vol_300
      t.float :rsi
      t.float :macd

      t.timestamps
    end
    add_index :candles, :ticker
    add_index :candles, :size
  end
end
