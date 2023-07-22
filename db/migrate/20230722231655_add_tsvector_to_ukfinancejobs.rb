class AddTsvectorToUkfinancejobs < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :searchable, :tsvector
    add_index :ukfinancejobs, :searchable, using: :gin
  end

end
