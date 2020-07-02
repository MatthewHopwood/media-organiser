require "rails_helper"

RSpec.describe Playlist, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:playlist)).to be_valid
  end

  describe "validations" do
    it "defines basic validations", :aggregate_failures do
      is_expected.to validate_presence_of(:name)
    end

    context "with a built record" do
      subject { FactoryBot.build(:playlist) }

      it "validates uniqueness" do
        is_expected.to validate_uniqueness_of(:name)
      end
    end
  end

  it "defines associations", :aggregate_failures do
    is_expected.to have_many(:playlist_media_files).dependent(:destroy)
    is_expected.to have_many(:media_files).through(:playlist_media_files)
  end
end
