class Nelcopost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  
  mount_uploader :image, ImageUploader
end
