require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        :order_id => 1,
        :user_id => 2,
        :status => "Status"
      ),
      Request.create!(
        :order_id => 1,
        :user_id => 2,
        :status => "Status"
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
