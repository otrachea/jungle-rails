require 'rails_helper'

RSpec.describe "useremails/index", type: :view do
  before(:each) do
    assign(:useremails, [
      Useremail.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        order_id: "Order"
      ),
      Useremail.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        order_id: "Order"
      )
    ])
  end

  it "renders a list of useremails" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Order".to_s, count: 2
  end
end
