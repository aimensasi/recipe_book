class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid, Should be xx@xx.com"}

  validates :password, presence: true, length: { in: 6..20 }

  has_many :recipes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader


end
