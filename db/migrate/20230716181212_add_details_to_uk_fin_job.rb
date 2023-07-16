class AddDetailsToUkFinJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :guesstimate, :boolean, default: false
  end
end
