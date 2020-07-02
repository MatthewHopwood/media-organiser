require "rails_helper"

RSpec.describe "Destroy Media File", type: :system do
  let!(:media_file) { FactoryBot.create(:media_file) }
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "asks for confirmation then removes the alert", js: true do
    visit media_file_path(media_file)
    page.accept_alert("Are you sure you wish to delete this media file?") do
      click_on "Delete"
    end

    expect(page)
      .to have_css(".alert-success", text: "Media File was successfully deleted.")
      .and have_current_path(media_files_path)
      .and have_no_text(media_file.name)
  end
end
