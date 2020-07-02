require "rails_helper"

RSpec.describe Image, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:image)).to be_valid
  end

  it "defines basic validations", :aggregate_failures do
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_presence_of(:file_path)
  end

  it "defines associations", :aggregate_failures do
    is_expected.to have_many(:media_files).dependent(:restrict_with_exception)
  end
end
