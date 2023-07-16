class Comment < ApplicationRecord
  belongs_to :ukfinancejob
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 1 }
end
