require "rails_helper"

RSpec.describe "Playlists Index", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "displays all playlists" do
    playlists = FactoryBot.create_list(:playlist, 2)
    visit root_path
    playlists.each { |playlist| expect(page).to have_text(playlist.name) }
  end
end
