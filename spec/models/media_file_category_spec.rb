require "rails_helper"

RSpec.describe MediaFileCategory, type: :model do
  it "defines associations", :aggregate_failures do
    is_expected.to belong_to :media_file
    is_expected.to belong_to :media_category
  end
end
