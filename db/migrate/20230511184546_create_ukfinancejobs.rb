class CreateUkfinancejobs < ActiveRecord::Migration[7.0]
  def change
    create_table :ukfinancejobs do |t|

      t.timestamps
    end
  end
end
