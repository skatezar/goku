class AddCompanyNameToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :company, :string

  end
end
