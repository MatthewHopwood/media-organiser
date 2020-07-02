require "rails_helper"

RSpec.describe "Media Types Index", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "displays all media types" do
    media_types = FactoryBot.create_list(:media_type, 2)
    visit media_types_path
    media_types.each { |media_type| expect(page).to have_text(media_type.name) }
  end
end
