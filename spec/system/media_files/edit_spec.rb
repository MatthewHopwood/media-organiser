require "rails_helper"

RSpec.describe "Edit Media File", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:media_file) { FactoryBot.create(:media_file) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media_file show page with a success message" do
      visit media_file_path(media_file)
      click_on "Edit"
      fill_in "Name", with: "Test Media File Edited"
      click_on "Save"

      expect(page)
        .to have_css(".alert-success", text: "Media File was successfully updated.")
        .and have_text("Test-Media-File-Edited")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit edit_media_file_path(media_file)
      fill_in "Name", with: ""
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end
end
