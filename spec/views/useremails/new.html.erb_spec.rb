require 'rails_helper'

RSpec.describe "useremails/new", type: :view do
  before(:each) do
    assign(:useremail, Useremail.new(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      order_id: "MyString"
    ))
  end

  it "renders new useremail form" do
    render

    assert_select "form[action=?][method=?]", useremails_path, "post" do

      assert_select "input[name=?]", "useremail[first_name]"

      assert_select "input[name=?]", "useremail[last_name]"

      assert_select "input[name=?]", "useremail[email]"

      assert_select "input[name=?]", "useremail[order_id]"
    end
  end
end
