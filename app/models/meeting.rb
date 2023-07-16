class Meeting < ApplicationRecord
	has_one_attached :photo1
	has_many :meetingcomments
end
