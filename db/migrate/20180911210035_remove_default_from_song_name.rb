class RemoveDefaultFromSongName < ActiveRecord::Migration[5.2]
  def change
    change_column_default :songs, :name, from: "Title", to: nil
  end
end
