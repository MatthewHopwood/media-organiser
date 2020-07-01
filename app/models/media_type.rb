class MediaType < ApplicationRecord
  has_many :media_files

  validates_presence_of :name
end
