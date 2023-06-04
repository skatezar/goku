class AddDescToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :desc, :string
  end
end
