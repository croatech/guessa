require 'rails_helper'

RSpec.describe "Select Game", type: :request do
  describe "GET /select_game" do
    it "checks redirect without session_key" do
      visit "/select_game"
      expect(page.current_path).to eq root_path
    end
  end
end
