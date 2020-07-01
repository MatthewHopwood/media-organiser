class PlaylistMediaFile < ApplicationRecord
  belongs_to :playlist
  belongs_to :media_file
end
