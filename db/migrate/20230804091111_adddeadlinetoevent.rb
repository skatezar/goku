class Adddeadlinetoevent < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :deadline_date, :datetime
  end
end
