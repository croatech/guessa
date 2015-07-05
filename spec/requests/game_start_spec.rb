require 'rails_helper'

RSpec.describe "Start Game", type: :request do
  describe "GET /games/start" do
    it "checks redirect without session_key" do
      visit "/games/start"
      expect(page.current_path).to eq root_path
    end
  end
end
