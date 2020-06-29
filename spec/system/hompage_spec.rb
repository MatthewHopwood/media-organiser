require "rails_helper"

RSpec.describe "Home Page", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before { login_as(user) }

  it "renders the homepage text" do
    visit root_path
    expect(page)
      .to have_text("Hi thre")
  end
end
