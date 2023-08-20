class AddDetailOnInterviewQuestionstoJob < ActiveRecord::Migration[7.0]
  def change
    add_column :ukfinancejobs, :interviewdatayear, :string
  end
end
