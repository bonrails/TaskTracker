require 'rails_helper'
describe DashboardController do

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      task = Task.create! name: 'test', description: 'test'
      get :index, {}
      expect(assigns(:tasks)).to eq([task])
    end

    it "assigns all tasks with  users" do
      user = User.create! name: 'Hey'
      task = Task.create! name: 'test', description: 'test', user_id: user.id
      get :index, {}
      expect(assigns(:tasks)[0].user).to eq(user)
    end

    it "assigns all tasks as @tasks include users" do
      record = double('User', :all => true)
      user = User.create! name: 'Hey'
      task = Task.create! name: 'test', description: 'test', user_id: user.id
      expect(Task).to receive(:includes).with(:user).and_return record
      get :index, {}
    end
  end

end