class MediaFileCategory < ApplicationRecord
  belongs_to :media_file
  belongs_to :media_category
end
