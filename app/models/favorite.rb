class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nelcopost
  
  validates :user_id, presence: true
  validates :nelcopost_id, presence: true
end
