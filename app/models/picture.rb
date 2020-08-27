class Picture < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
end
