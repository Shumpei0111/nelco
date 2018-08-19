class Nelcopost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, precence: true
  validates :title, precence: true, length: { maximum: 30 }
end
