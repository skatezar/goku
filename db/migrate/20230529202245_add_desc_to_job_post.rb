class AddDescToJobPost < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :description, :string
  end
end
