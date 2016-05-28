require 'test_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'RailsP'" do
      visit '/static_pages/home'
      expect(page).to have_content('RailsP')
    end
  end
end
class StaticPagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
