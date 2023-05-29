class AddCoachingRequestDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :coachingrequests, :email, :string
    add_column :coachingrequests, :description, :string
  end
end
