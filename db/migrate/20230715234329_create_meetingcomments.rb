class CreateMeetingcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :meetingcomments do |t|
      t.references :meeting, null: false, foreign_key: true
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
