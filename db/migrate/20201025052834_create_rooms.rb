class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :comic
      t.text :agenda, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
