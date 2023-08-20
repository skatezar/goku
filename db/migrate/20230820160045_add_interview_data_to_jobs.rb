class AddInterviewDataToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :interviewdata, :string
    add_column :ukfinancejobs, :interviewdatabool, :boolean, default: false
  end
end
