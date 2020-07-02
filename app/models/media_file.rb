class MediaFile < ApplicationRecord
  belongs_to :media_type
  belongs_to :image, optional: true
  has_many :media_file_categories, dependent: :destroy
  has_many :playlist_media_files, dependent: :destroy
  has_many :media_categories, through: :media_file_categories
  has_many :playlists, through: :playlist_media_files

  validates_presence_of :name, :file_path

  paginates_per 10

  def full_path
    "#{file_path}#{file_name}"
  end

  def file_name
    name.titleize.tr(' ', '-')
  end
end
