class AddFieldInFinance < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :field_in_finance, :string
  end
end
