require "rails_helper"

RSpec.describe "Media Files Index", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "displays all media files" do
    media_files = FactoryBot.create_list(:media_file, 2)
    visit media_files_path
    media_files.each { |media_file| expect(page).to have_link(media_file.name.titleize, href: media_file_path(media_file)) }
  end
end
