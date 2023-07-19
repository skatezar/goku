class Ukfinancejob < ApplicationRecord
	has_one_attached :photo
	has_many :comments, dependent: :destroy
	validates :photo, presence: true

end
