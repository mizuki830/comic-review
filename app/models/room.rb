class Room < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :room_tags
  has_many :room_tags
end
