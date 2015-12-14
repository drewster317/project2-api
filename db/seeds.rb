Profile.delete_all
User.delete_all

student_names = %w(drew gabe timmy)

# Create a couple of students
student_names.each do |name|
  email = "#{name}@#{name}.com"
  user = User.create!(email: email, password: 'abc123', password_confirmation: 'abc123')
  puts "Create student user #{email}"
  user.create_profile!(first_name: name, last_name: 'jones', comment: name + " needs help")
end

teacher_names = %w(tom jeff antony saad matt)
# Create a couple of teachers
teacher_names.each do |name|
  email = "#{name}@#{name}.com"
  user = User.create!(email: email, password: 'abc123',
               password_confirmation: 'abc123', instructor_role: true)
  user.create_profile(first_name: name, last_name: 'smith', comment: name + " will help")
  puts "Create instructor user #{email}"
end


student_names.each do |name|
  student = User.where(email: "#{name}@#{name}.com")
end

%w(tom jeff antony saad matt).each do |name|
  instructor = User.where(email: "#{name}@#{name}.com")
end
