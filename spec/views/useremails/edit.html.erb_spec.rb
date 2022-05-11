require 'rails_helper'

RSpec.describe "useremails/edit", type: :view do
  before(:each) do
    @useremail = assign(:useremail, Useremail.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      order_id: "MyString"
    ))
  end

  it "renders the edit useremail form" do
    render

    assert_select "form[action=?][method=?]", useremail_path(@useremail), "post" do

      assert_select "input[name=?]", "useremail[first_name]"

      assert_select "input[name=?]", "useremail[last_name]"

      assert_select "input[name=?]", "useremail[email]"

      assert_select "input[name=?]", "useremail[order_id]"
    end
  end
end
