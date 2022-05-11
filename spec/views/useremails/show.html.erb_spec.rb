require 'rails_helper'

RSpec.describe "useremails/show", type: :view do
  before(:each) do
    @useremail = assign(:useremail, Useremail.create!(
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      order_id: "Order"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Order/)
  end
end
