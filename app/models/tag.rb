class Tag < ApplicationRecord
  has_many :rooms, through: :room_tags
  has_many :room_tags

  validates :name, uniqueness: true
end
