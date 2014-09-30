require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name"
      ),
      User.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "div.row",:count => 3
  end
end
