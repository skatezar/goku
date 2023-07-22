class Addeligiblitiytoevent < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :eligibility, :string
  end
end
