class RoomTag

  include ActiveModel::Model
  attr_accessor :name, :comic, :agenda, :tag, :user_id

  validates :image, presence: true
  validates :name, { maximum: 15 }
  validates :agenda, { maximum: 50 }, presence: true
  validates :tag, { maximum: 15 }

  def save
    room = Room.create(name: name, comic: comic, agenda: agenda, user_id: user.id)
    tag = Tag.where(tag: tag).first_or_initialize
    tag.save

    RoomTag.create(room_id: room.id, tag_id: tag.id)
  end

end