require "rails_helper"

RSpec.describe "Image Details", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:image) { FactoryBot.create(:image) }

  before { login_as(user) }

  it "displays image details" do
    visit images_path
    click_on image.name.titleize

    expect(page)
      .to have_css("h1", text: image.name.titleize)
      .and have_text(image.file_name)
      .and have_text(image.full_path)
  end
end
