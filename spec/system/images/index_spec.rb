require "rails_helper"

RSpec.describe "Images Index", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "displays all images" do
    images = FactoryBot.create_list(:image, 2)
    visit images_path
    images.each { |image| expect(page).to have_text(image.name.titleize) }
  end
end
