require "rails_helper"

RSpec.describe "Edit Image", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:image) { FactoryBot.create(:image) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the image show page with a success message" do
      visit "images/#{image.id}"
      click_on "Edit"
      fill_in "Name", with: "Test Image Edited"
      click_on "Save"

      expect(page)
        .to have_css(".alert-success", text: "Image was successfully updated.")
        .and have_text("Test Image Edited")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit edit_image_path(image)
      fill_in "Name", with: ""
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end
end
