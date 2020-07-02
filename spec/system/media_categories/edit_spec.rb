require "rails_helper"

RSpec.describe "Edit Media Category", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:media_category) { FactoryBot.create(:media_category) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media_category show page with a success message" do
      visit media_category_path(media_category)
      click_on "Edit"
      fill_in "Name", with: "Test Media Category Edited"
      click_on "Save"

      expect(page)
        .to have_css(".alert-success", text: "Media Category was successfully updated.")
        .and have_text("Test Media Category Edited")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit edit_media_category_path(media_category)
      fill_in "Name", with: ""
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end
end
