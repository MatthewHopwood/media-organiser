require "rails_helper"

RSpec.describe "Edit Playlist", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:playlist) { FactoryBot.create(:playlist) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the playlist show page with a success message" do
      visit playlist_path(playlist)
      click_on "Edit"
      fill_in "Name", with: "Test Playlist Edited"
      click_on "Save"

      expect(page)
        .to have_css(".alert-success", text: "Playlist was successfully updated.")
        .and have_text("Test Playlist Edited")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit edit_playlist_path(playlist)
      fill_in "Name", with: ""
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end
end
