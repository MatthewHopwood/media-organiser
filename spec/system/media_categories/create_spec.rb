require "rails_helper"

RSpec.describe "Create Media Category", type: :system do
  let!(:user){ FactoryBot.create(:user) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media category show page with a success message" do
      visit media_categories_path
      click_on "Add Media Category"
      complete_form

      expect(page)
        .to have_css(".alert-success", text: "Media Category was successfully created.")
        .and have_css("h1", text: "Test Category")
        .and have_text("Test Category")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit new_media_category_path
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end

  def complete_form
    fill_in "Name", with: "Test Category"
    click_on "Save"
  end
end
