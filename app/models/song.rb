class Song < ApplicationRecord
  validates :song,   presence: true
  validates :name,   presence: true
  validates :artist, presence: true
  mount_uploader :picture, PictureUploader
  mount_uploader :song,    SongUploader
  acts_as_taggable
  acts_as_taggable_on :albums

  scope :album_order, -> { order(num: :asc) }

end
