class RoomTags
  include ActiveModel::Model
  attr_accessor :image, :name, :comic, :agenda, :tag, :user_id

  validates :image, presence: true
  validates :name, length: { maximum: 20 }
  validates :agenda, length: { maximum: 50 }, presence: true
  validates :tag, length: { maximum: 15 }

  def save
    room = Room.create(image: image, name: name, comic: comic, agenda: agenda, user_id: user_id)
    tag = Tag.where(tag: tag).first_or_initialize
    tag.save

    RoomTag.create(room_id: room.id, tag_id: tag.id)
  end

end