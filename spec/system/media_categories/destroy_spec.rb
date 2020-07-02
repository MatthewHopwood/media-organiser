require "rails_helper"

RSpec.describe "Destroy Media Category", type: :system do
  let!(:media_category) { FactoryBot.create(:media_category) }
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "asks for confirmation then removes the alert", js: true do
    visit media_category_path(media_category)
    page.accept_alert("Are you sure you wish to delete this media category?") do
      click_on "Delete"
    end

    expect(page)
      .to have_css(".alert-success", text: "Media Category was successfully deleted.")
      .and have_current_path(media_categories_path)
      .and have_no_text(media_category.name)
  end
end
