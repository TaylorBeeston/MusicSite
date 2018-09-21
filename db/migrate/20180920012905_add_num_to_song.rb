class AddNumToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :num, :integer
  end
end
