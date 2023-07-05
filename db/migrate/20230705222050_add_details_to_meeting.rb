class AddDetailsToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :location, :string
    add_column :meetings, :virtual_or_inperson, :string
    add_column :meetings, :link_to_url, :string
    add_column :meetings, :description, :string
  end
end
