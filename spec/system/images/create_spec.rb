require "rails_helper"

RSpec.describe "Create Image", type: :system do
  let!(:user){ FactoryBot.create(:user) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the image show page with a success message" do
      visit images_path
      click_on "Add Image"
      complete_form

      expect(page)
        .to have_css(".alert-success", text: "Image was successfully created.")
        .and have_css("h1", text: "Test Image")
        .and have_text("Test-Image")
        .and have_text("D:/Home/Images/Test-Image")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit new_image_path
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end

  def complete_form
    fill_in "Name", with: "Test Image"
    fill_in "File Path", with: "D:/Home/Images/"
    click_on "Save"
  end
end
