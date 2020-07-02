require "rails_helper"

RSpec.describe "Create Media File", type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:media_type) { FactoryBot.create(:media_type) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the media file show page with a success message" do
      visit media_files_path
      click_on "Add Media File"
      complete_form

      expect(page)
        .to have_css(".alert-success", text: "Media File was successfully created.")
        .and have_css("h1", text: "Test Media File")
        .and have_css("u", text: "Test-Media-File")
        .and have_text("D:/Examples/Tests")
        .and have_text(media_type.name)
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit new_media_file_path
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end

  def complete_form
    fill_in "Name", with: "Test Media File"
    fill_in "File Path", with: "D:/Examples/Tests"
    select media_type.name
    click_on "Save"
  end
end
