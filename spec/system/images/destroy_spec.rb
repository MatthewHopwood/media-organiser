require "rails_helper"

RSpec.describe "Destroy Image", type: :system do
  let!(:image) { FactoryBot.create(:image) }
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  context "when image has no associated media files" do
    it "asks for confirmation then removes the alert", js: true do
      visit "images/#{image.id}"
      page.accept_alert("Are you sure you wish to delete this image?") do
        click_on "Delete"
      end

      expect(page)
        .to have_css(".alert-success", text: "Image was successfully deleted.")
        .and have_current_path(images_path)
        .and have_no_text(image.name)
    end
  end

  context "when image has and associated media files" do
    let!(:media_file) { FactoryBot.create(:media_file, image: image) }

    it "does not display delete button" do
      visit "images/#{image.id}"

      expect(page)
        .to have_no_css(".btn", text: "Delete")
    end
  end
end
