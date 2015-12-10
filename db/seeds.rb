# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Profile.delete_all
User.delete_all

%w(drew gabe timmy).each do |name|
  email = "#{name}@#{name}.com"
  user = User.create!(email: email, password: 'abc123', password_confirmation: 'abc123')
  puts "Create user #{email}"
  user.create_profile!(first_name: name, last_name: 'jones', comment: name + " needs help")
end

%w(tom jeff antony saad matt).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  user = User.create!(email: email, password: 'abc123',
               password_confirmation: 'abc123', instructor_role: true)
   user.create_profile(first_name: name, last_name: 'smith', comment: name + " will help")

end

