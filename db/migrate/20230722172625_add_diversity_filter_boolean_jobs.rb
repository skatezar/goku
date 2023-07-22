class AddDiversityFilterBooleanJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :diversity, :boolean, default: false
  end
end
