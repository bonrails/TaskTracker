require 'rails_helper'

RSpec.describe Task, :type => :model do
  context 'validations' do
    it "should have name"   do
      task = Task.new(name: "" )
      task.save
      expect(task.errors[:name]).to include("can't be blank")
    end
    it "should have description"   do
      task = Task.new(description: "" )
      task.save
      expect(task.errors[:description]).to include("can't be blank")
    end
  end
  context 'associations' do
    it "should belong to user" do
      t = Task.new(name: 'spec_task',description: 'write model spec')
      u = User.new(name: 'george')
      t.user = u
      t.save
      expect(t.user).to eq u
    end
  end
end
