require "rails_helper"

RSpec.describe MediaCategory, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:media_category)).to be_valid
  end

  describe "validations" do
    it "defines basic validations", :aggregate_failures do
      is_expected.to validate_presence_of(:name)
    end

    context "with a built record" do
      subject { FactoryBot.build(:media_category) }

      it "validates uniqueness" do
        is_expected.to validate_uniqueness_of(:name)
      end
    end
  end

  it "defines associations", :aggregate_failures do
    is_expected.to have_many(:media_file_categories).dependent(:destroy)
    is_expected.to have_many(:media_files).through(:media_file_categories)
  end
end
