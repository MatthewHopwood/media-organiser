require "rails_helper"

RSpec.describe "Media Type Details", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:media_type) { FactoryBot.create(:media_type) }

  before { login_as(user) }

  context "with no associated media files" do

    it "displays media type details" do
      visit media_types_path
      click_on media_type.name

      expect(page)
        .to have_css("h1", text: media_type.name)
        .and have_css("u", text: media_type.name)
    end
  end

  context "with associated media files" do
    it "display the list of media files" do
      media_files = FactoryBot.create_list(:media_file, 2, media_type: media_type)
      visit media_type_path(media_type)

      media_files.each { |media_file| expect(page).to have_link(media_file.name, href: media_file_path(media_file)) }
    end
  end
end
