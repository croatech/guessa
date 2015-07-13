require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :title => "MyString",
      :desc => "MyText",
      :status => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_title[name=?]", "order[title]"

      assert_select "textarea#order_desc[name=?]", "order[desc]"

      assert_select "input#order_status[name=?]", "order[status]"
    end
  end
end
