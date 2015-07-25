require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :text => "Text"
      ),
      Article.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
