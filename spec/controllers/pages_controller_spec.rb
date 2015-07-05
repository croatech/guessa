require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #select_game" do
    it "returns http success" do
      visit "select_game"
      expect(response).to have_http_status(:success)
    end
  end

end
