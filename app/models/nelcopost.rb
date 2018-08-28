class Nelcopost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :favs, through: :favorites, source: :user
  
  def fav(other_user)
    unless self == other_user
      self.favorites.find_or_create_by(user_id: other_user.id)
    end
  end
  
  def unfav(other_user)
    favorite = self.favorites.find_by(user_id: other_user.id)
    favorite.destroy if favorite
  end
  
  def faving?(other_user)
    self.favs.include?(other_user)
  end
end
