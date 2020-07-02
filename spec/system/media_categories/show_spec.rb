require "rails_helper"

RSpec.describe "Media Category Details", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:media_category) { FactoryBot.create(:media_category) }

  before { login_as(user) }

  context "with no associated media files" do

    it "displays media category details" do
      visit media_categories_path
      click_on media_category.name

      expect(page)
        .to have_css("h1", text: media_category.name.titleize)
        .and have_css("u", text: media_category.name)
    end
  end

  context "with associated media files" do
    it "display the list of media files" do
      media_files = FactoryBot.create_list(:media_file, 2, media_categories: [media_category])
      visit media_category_path(media_category)

      media_files.each { |media_file| expect(page).to have_link(media_file.name, href: media_file_path(media_file)) }
    end
  end
end
