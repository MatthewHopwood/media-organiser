class MediaType < ApplicationRecord
  has_many :media_files, dependent: :restrict_with_exception

  validates_presence_of :name
end
