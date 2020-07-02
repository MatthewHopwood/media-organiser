require "rails_helper"

RSpec.describe "Media Type Details", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:playlist) { FactoryBot.create(:playlist) }

  before { login_as(user) }

  context "with no associated media files" do

    it "displays playlist details" do
      visit root_path
      click_on playlist.name

      expect(page)
        .to have_css("h1", text: playlist.name.titleize)
        .and have_css("u", text: playlist.name)
        .and have_text( playlist.created_at.strftime('%d %b %Y'))
    end
  end

  context "with associated media files" do
    it "display the list of media files" do
      media_files = FactoryBot.create_list(:media_file, 2, playlists: [playlist])
      visit playlist_path(playlist)

      media_files.each { |media_file| expect(page).to have_link(media_file.name, href: media_file_path(media_file)) }
    end
  end
end
