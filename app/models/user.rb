class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :participations, dependent: :destroy
  has_many :contributions, through: :participations

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  mount_uploader :avatar, PhotoUploader

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
