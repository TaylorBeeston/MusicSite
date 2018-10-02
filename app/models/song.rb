class Song < ApplicationRecord
  validates :song,   presence: true
  validates :name,   presence: true
  validates :artist, presence: true
  mount_uploader :picture, PictureUploader
  mount_uploader :song,    SongUploader
  acts_as_taggable
  acts_as_taggable_on :albums

  scope :album_order, ->       { order(num: :asc) }
  scope :asc_sort,    ->       { all.order(name: :asc) }
  scope :tag_counts,  ->       { tag_counts_on(:tags) }
  scope :tagged,      -> (tag) { tagged_with(tag).order(name: :asc) }
  scope :album_tag,   -> (alb) { all.tagged_with(alb, on: :albums).album_order }

end
