class Room < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :room_tags
  has_many :room_tags
  has_one_attached :image

  validates :image, presence: true
  validates :name, length: { maximum: 20 }
  validates :agenda, length: { maximum: 50 }, presence: true
end
