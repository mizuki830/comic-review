class RoomTags
  include ActiveModel::Model
  attr_accessor :tag, :room_id

  validates :tag, length: { maximum: 15 }

  def save
    tag = Tag.create(tag: tag)

    RoomTag.create(room_id: currennt_room.id, tag_id: tag.id)
  end

end