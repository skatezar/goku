class AddBlogDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :para1, :string
    add_column :blogs, :para2, :string
    add_column :blogs, :para3, :string
    add_column :blogs, :para4, :string
    add_column :blogs, :para5, :string
  end
end
