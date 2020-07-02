require "rails_helper"

RSpec.describe "Edit Media Type", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:media_type) { FactoryBot.create(:media_type) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media_type show page with a success message" do
      visit media_type_path(media_type)
      click_on "Edit"
      fill_in "Name", with: "Test Media Type Edited"
      click_on "Save"

      expect(page)
        .to have_css(".alert-success", text: "Media Type was successfully updated.")
        .and have_text("Test Media Type Edited")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit edit_media_type_path(media_type)
      fill_in "Name", with: ""
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end
end
