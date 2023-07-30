class User < ApplicationRecord
  after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile

  after_create :create_profile

  private

  def create_profile
    build_profile.save
  end

  has_many :favorites
  has_many :favorite_ukfinancejobs, through: :favorites, source: :ukfinancejob

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
