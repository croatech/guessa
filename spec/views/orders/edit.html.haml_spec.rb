require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :title => "MyString",
      :desc => "MyText",
      :status => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_title[name=?]", "order[title]"

      assert_select "textarea#order_desc[name=?]", "order[desc]"

      assert_select "input#order_status[name=?]", "order[status]"
    end
  end
end
