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

      t.timestamps
    end
    add_index :candles, :ticker
    add_index :candles, :size
  end
end
