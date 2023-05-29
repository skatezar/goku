class CreateMailforms < ActiveRecord::Migration[7.0]
  def change
    create_table :mailforms do |t|

      t.timestamps
    end
  end
end
