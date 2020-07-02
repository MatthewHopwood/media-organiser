require "rails_helper"

RSpec.describe "Create Playlist", type: :system do
  let!(:user){ FactoryBot.create(:user) }

  before { login_as(user) }

  context "with valid data" do
    it "redirects to the playlist show page with a success message" do
      visit root_path
      click_on "Add Playlist"
      complete_form

      expect(page)
        .to have_css(".alert-success", text: "Playlist was successfully created.")
        .and have_css("h1", text: "Test Playlist")
        .and have_css("u", text: "Test Playlist")
    end
  end

  context "with invalid data" do
    it "displays an error message" do
      visit new_playlist_path
      click_on "Save"

      expect(page).to have_text("can't be blank")
    end
  end

  def complete_form
    fill_in "Name", with: "Test Playlist"
    click_on "Save"
  end
end
