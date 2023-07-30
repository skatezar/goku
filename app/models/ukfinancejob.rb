class Ukfinancejob < ApplicationRecord
	require 'pg_search'
	has_one_attached :photo
	has_many :comments, dependent: :destroy
	validates :title, :url, :company, :type_of_job, :location, :application_opening_date, :deadline_date, :eligibility, :industry, :hr_email, :app_process, :description, presence: true
 	has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user

  include PgSearch::Model
	pg_search_scope :search_by_keyword, against: %i[title company type_of_job location description],
                                    using: {
                                      tsearch: { prefix: true }
                                    }
end