require "rails_helper"

RSpec.describe "Destroy Media Type", type: :system do
  let!(:media_type) { FactoryBot.create(:media_type) }
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  context "when media type has no associated media files" do
    it "asks for confirmation then removes the alert", js: true do
      visit media_type_path(media_type)
      page.accept_alert("Are you sure you wish to delete this media type?") do
        click_on "Delete"
      end

      expect(page)
        .to have_css(".alert-success", text: "Media Type was successfully deleted.")
        .and have_current_path(media_types_path)
        .and have_no_text(media_type.name)
    end
  end

  context "when media type has and associated media files" do
    let!(:media_file) { FactoryBot.create(:media_file, media_type: media_type) }

    it "does not display delete button" do
      visit media_type_path(media_type)

      expect(page)
        .to have_no_css(".btn", text: "Delete")
    end
  end
end
