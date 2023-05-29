class CreateCoachingrequests < ActiveRecord::Migration[7.0]
  def change
    create_table :coachingrequests do |t|

      t.timestamps
    end
  end
end
