class AddGuessTimateDeadelineJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :guesstimate_deadline, :boolean, default: false
  end
end
