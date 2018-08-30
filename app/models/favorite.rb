class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nelcopost
  
  validates :user_id, presence: true
  validates :nelcopost_id, presence: true
  
  def self.ranking
    self.group(:nelcopost_id).order("count_nelcopost_id DESC").limit(4).count(:nelcopost_id)
  end
end
