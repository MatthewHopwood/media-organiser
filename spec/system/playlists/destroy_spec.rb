require "rails_helper"

RSpec.describe "Destroy Playlist", type: :system do
  let!(:playlist) { FactoryBot.create(:playlist) }
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "asks for confirmation then removes the alert", js: true do
    visit playlist_path(playlist)
    page.accept_alert("Are you sure you wish to delete this playlist?") do
      click_on "Delete"
    end

    expect(page)
      .to have_css(".alert-success", text: "Playlist was successfully deleted.")
      .and have_current_path(root_path)
      .and have_no_text(playlist.name)
  end
end
