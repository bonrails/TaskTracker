require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    user = User.create! name: 'test'
    task =  Task.create!(
        :name => "Name",
        :description => 'other desc'
    )
    task.user = user
    assign(:tasks, [task,task])
  end

  it "renders a list of tasks" do
    render
    assert_select "div.row",:count => 3
  end
end
