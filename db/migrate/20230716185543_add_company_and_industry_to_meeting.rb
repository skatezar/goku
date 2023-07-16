class AddCompanyAndIndustryToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :company, :string
    add_column :meetings, :industry, :string
  end
end
