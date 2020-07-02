require "rails_helper"

RSpec.describe "Create Media Type", type: :system do
  let!(:user){ FactoryBot.create(:user) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media type show page with a success message" do
      visit media_types_path
      click_on "Add Media Type"
      complete_form

      expect(page)
        .to have_css(".alert-success", text: "Media Type was successfully created.")
        .and have_css("h1", text: "Test Media Type")
        .and have_css("u", text: "Test Media Type")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit new_media_type_path
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end

  def complete_form
    fill_in "Name", with: "Test Media Type"
    click_on "Save"
  end
end
