class MediaCategory < ApplicationRecord
  has_many :media_file_categories
  has_many :media_files, through: :media_file_categories

  validates_presence_of :name
end
