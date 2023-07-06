class AddDetailsToUkFinanceJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :title, :string
    add_column :ukfinancejobs, :url, :string
    add_column :ukfinancejobs, :type_of_job, :string
    add_column :ukfinancejobs, :location, :string
    add_column :ukfinancejobs, :deadline_date, :datetime
    add_column :ukfinancejobs, :rolling_admission, :boolean
  end
end
