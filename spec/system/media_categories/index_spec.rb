require "rails_helper"

RSpec.describe "Media Categories Index", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "displays all media categories" do
    media_categories = FactoryBot.create_list(:media_category, 2)
    visit media_categories_path
    media_categories.each { |media_category| expect(page).to have_text(media_category.name) }
  end
end
