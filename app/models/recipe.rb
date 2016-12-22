class Recipe < ActiveRecord::Base
include PgSearch
  belongs_to :user
  has_many :ingredients, dependent: :destroy


  validates_presence_of :title

  mount_uploader :avatar, AvatarUploader

  pg_search_scope :search_by_full_name, :against => [:title]



end
