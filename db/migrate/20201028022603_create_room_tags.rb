class CreateRoomTags < ActiveRecord::Migration[6.0]
  def change
    create_table :room_tags do |t|

      t.timestamps
    end
  end
end
