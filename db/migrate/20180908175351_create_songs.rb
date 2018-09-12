class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name, default: "Title"
      t.string :artist, default: "Ashley's Brother"
      t.string :song, null: false
      t.text   :bio
      t.string :picture

      t.index :name

      t.timestamps
    end
  end
end
