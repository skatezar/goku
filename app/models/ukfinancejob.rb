class Ukfinancejob < ApplicationRecord
	has_one_attached :photo
	has_many :comments, dependent: :destroy
	validates :title, :url, :company, :type_of_job, :location, :application_opening_date, :deadline_date, :eligibility, :industry, :hr_email, :app_process, :description, presence: true
 	has_many :favorites
  	has_many :favorited_by_users, through: :favorites, source: :user
end