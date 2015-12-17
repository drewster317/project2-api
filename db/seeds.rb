Profile.delete_all
User.delete_all
HelpItem.delete_all

student_names = %w(drew gabe timmy)

# Create a couple of students
student_names.each do |name|
  email = "#{name}@example.com"
  user = User.create!(email: email, password: 'pw', password_confirmation: 'pw')
  puts "Create student user #{email}"
  user.create_profile!(first_name: name, last_name: 'jones', comment: name + " needs help")
end

teacher_names = %w(tom jeff antony saad matt)
# Create a couple of teachers
teacher_names.each do |name|
  email = "#{name}@example.com"
  user = User.create!(email: email, password: 'pw',
               password_confirmation: 'pw', instructor_role: true)
  user.create_profile(first_name: name, last_name: 'smith', comment: name + " will help")
  puts "Create instructor user #{email}"
end


student_names.each do |name|
  student = User.where(email: "#{name}@example.com").first
  rand(2..5).times do |i|
    student.create_help_item("Help Item #{i} for #{name}")
  end
end


tom =  Profile.find_by_first_name('tom').user
tom.assign_me_next_item

# jeff =  Profile.find_by_first_name('jeff').user
#jeff.assign_me_next_item

#saad =  Profile.find_by_first_name('saad').user
#saad.assign_me_next_item
