require "rails_helper"

RSpec.describe MediaFile, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:media_file)).to be_valid
  end

  it "defines basic validations", :aggregate_failures do
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:file_path)

  end

  it "defines associations", :aggregate_failures do
    is_expected.to have_many(:playlist_media_files).dependent(:destroy)
    is_expected.to have_many(:media_file_categories).dependent(:destroy)
    is_expected.to have_many(:media_categories).through(:media_file_categories)
    is_expected.to have_many(:playlists).through(:playlist_media_files)
    is_expected.to belong_to(:media_type)
    is_expected.to belong_to(:image).optional
  end
end
