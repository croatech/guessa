require 'rails_helper'

RSpec.describe "root", type: :request do
  describe "GET /" do
    before :each do
      visit "/"
    end 

    it "checks home page content without session key" do
      expect(page).to have_selector("input[type=submit][value='enter']")
    end

    it "checks redirect to start game page after filled up the form" do
      fill_in "name", with: "Fry"
      click_button "enter"
      expect(page.current_path).to eq start_games_path
    end
  end
end
