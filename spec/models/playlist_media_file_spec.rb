require "rails_helper"

RSpec.describe PlaylistMediaFile, type: :model do
  it "defines associations", :aggregate_failures do
    is_expected.to belong_to :media_file
    is_expected.to belong_to :playlist
  end
end
