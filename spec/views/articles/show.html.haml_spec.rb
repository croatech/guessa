require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end
