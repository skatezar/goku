class Meeting < ApplicationRecord
	has_one_attached :photo1
	has_many :meetingcomments
	validates :name, :start_time, :photo1, :location, :virtual_or_inperson,:description, :link_to_url, :eligibility, :company, :industry, :deadline_date, presence: true


end
