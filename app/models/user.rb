class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid, Should be xx@xx.com"}

  validates :password, presence: true, length: { in: 6..20 }

  has_many :recipes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader


  # has_many :authentications, :dependent=>:destory

#   def self.create_with_auth_and_has(authentication,auth_hash)
#     create! do |u|
#       u.name = auth_hash["name"]
#       u.email = auth_hash["extra"]["raw_info"]["email"]
#       u.authentications<<(authentication)
#     end
#   end

#   def fb_token
#     x = self.authentications.where(:provider=>:facebook).first
#     return x.token unless x.nil?
#   end
  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.oauth_token = auth.credentials.token
      user.save(:validate=>false)
    end
  end
end

