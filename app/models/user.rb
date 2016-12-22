class User < ActiveRecord::Base


  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid, Should be xx@xx.com"}
  has_secure_password
  validates :password, presence: true, length: { in: 6..20 }




end
