# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_users_and_tasks
  ['Todd', 'Josh','Lilly', 'Kate'].each do |name|
     user = User.create(:name => name)
     Task.create(:name => "#{name}_task", :user_id => user.id, :description => 'another desc' )
  end
end

create_users_and_tasks
t
(1..10).each do |c|
  t = c
  p t
end
t