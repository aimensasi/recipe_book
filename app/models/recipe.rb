class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients, dependent: :destroy


  validates_presence_of :title

  mount_uploader :avatar, AvatarUploader

end
