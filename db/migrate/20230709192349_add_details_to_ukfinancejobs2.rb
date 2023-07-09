class AddDetailsToUkfinancejobs2 < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :application_opening_date, :datetime
    add_column :ukfinancejobs, :eligibility, :string
    add_column :ukfinancejobs, :industry, :string
    add_column :ukfinancejobs, :hr_email, :string
    add_column :ukfinancejobs, :app_process, :string

  end
end
