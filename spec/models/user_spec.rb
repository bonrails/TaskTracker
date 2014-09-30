require 'rails_helper'
  RSpec.describe Task, :type => :model do
    context 'validations' do
      it "should have name"   do
        user = User.new(name: "" )
        user.save
        expect(user.errors[:name]).to include("can't be blank")
      end
    end
    context 'associations' do
      it "has many tasks" do
        t1 = Task.new(name: 'spec_task',description: 'write model spec')
        t2 = Task.new(name: 'model_spec_task',description: 'write user model spec')
        u = User.new(name: 'george')
        t1.user = u
        t2.user = u
        t1.save
        t2.save
        expect(u.tasks).to eq [t1,t2]
      end
    end
  end

