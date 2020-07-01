class MediaCategory < ApplicationRecord
  has_many :media_file_categories, dependent: :destroy
  has_many :media_files, through: :media_file_categories

  validates_presence_of :name
  validates_uniqueness_of :name
end
