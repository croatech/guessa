require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :score => 1,
      :user_id => 1
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_score[name=?]", "game[score]"

      assert_select "input#game_user_id[name=?]", "game[user_id]"
    end
  end
end
