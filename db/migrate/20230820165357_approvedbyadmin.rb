class Approvedbyadmin < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :approved_by_admin, :boolean, default: false
  end
end
