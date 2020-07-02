require "rails_helper"

RSpec.describe "Home Page Navigation", type: :system do
  let!(:user) { FactoryBot.create(:user) }


  context "when a user signed in" do

    it "displays all of the links for the application" do
      visit root_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"

      expect(page)
        .to have_css("h1", text: "Playlists")
        .and have_link("Playlists", href: root_path)
        .and have_link("Media Files", href: media_files_path)
        .and have_link("Media Types", href: media_types_path)
        .and have_link("Categories", href: media_categories_path)
        .and have_link("Images", href: images_path)
        .and have_link("Sign Out", href: destroy_user_session_path)
    end
  end

  context "when a user is not signed in" do
    it "displays no content and only the sign in link" do
      visit root_path

      expect(page)
        .to have_no_css("h1", text: "Playlists")
        .and have_css("h1", text: "Log in")
        .and have_css(".alert.alert-warning", text: "You need to sign in or sign up before continuing.")
        .and have_no_link("Playlists", href: root_path)
        .and have_link("Sign In", href: new_user_session_path)
    end
  end
end
