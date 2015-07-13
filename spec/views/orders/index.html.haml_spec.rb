require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :title => "Title",
        :desc => "MyText",
        :status => "Status"
      ),
      Order.create!(
        :title => "Title",
        :desc => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
