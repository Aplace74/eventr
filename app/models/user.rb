class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :participations
  has_many :contributions, through: :participations

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  mount_uploader :avatar, PhotoUploader
end
