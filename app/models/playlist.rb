class Playlist < ApplicationRecord
  has_many :playlist_media_files, dependent: :destroy
  has_many :media_files, through: :playlist_media_files

  validates_presence_of :name
  validates_uniqueness_of :name

end
