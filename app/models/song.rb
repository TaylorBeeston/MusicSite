class Song < ApplicationRecord
  validates :song, presence: true
  mount_uploader :picture, PictureUploader
  mount_uploader :song,    SongUploader
  acts_as_taggable
end
