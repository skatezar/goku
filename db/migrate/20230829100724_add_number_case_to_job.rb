class AddNumberCaseToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :numberassessment, :string
  end
end
