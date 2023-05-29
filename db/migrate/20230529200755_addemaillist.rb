class Addemaillist < ActiveRecord::Migration[7.0]
  def change
    add_column :mailforms, :email, :string
  end
end
