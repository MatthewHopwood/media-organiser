require "rails_helper"

RSpec.describe "Media File Details", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:media_type) { FactoryBot.create(:media_type) }
  let!(:media_file) { FactoryBot.create(:media_file, media_type: media_type) }

  before { login_as(user) }

  context "with required fields only" do
    it "displays media file details" do
      visit media_files_path
      click_on media_file.name.titleize

      expect(page)
        .to have_css("h1", text: media_file.name.titleize)
        .and have_css("u", text: media_file.file_name)
        .and have_text(media_file.full_path)
        .and have_text(media_file.media_type.name)
    end
  end

  context "with all fields" do
    let!(:media_category) { FactoryBot.create(:media_category) }
    let!(:image) { FactoryBot.create(:image) }
    let!(:media_file) do
      FactoryBot.create(
        :media_file,
        :with_full_details,
        media_type: media_type,
        image: image,
        media_categories: [media_category]
      )
    end

    it "display all the media file details" do
      visit media_file_path(media_file)
      expect(page)
        .to have_text("#{media_file.media_categories.first.name} /")
        .and have_text(media_file.comment)

    end
  end
end
