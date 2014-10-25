# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Problem.delete_all
Note.delete_all

user = User.create!(
                    email:                 "user@example.org",
                    password:              "password",
                    password_confirmation: "password")

other_users = Array.new(10).map { |_| User.create!(
                                                   email:                 Faker::Internet.email,
                                                   password:              "password",
                                                   password_confirmation: "password") }

20.times do
	Problem.create!(description: "#{['In Rails, can I', 'How do you', 'Why would you'].sample} #{Faker::Company.bs}?",
	                 history:  Faker::Hacker.say_something_smart,
	                 user:  user)
end

problems = Problem.all

50.times do
	Note.create!(problem: problems.sample,
	               text:     Faker::Hacker.say_something_smart,
	               user:     other_users.sample)
end
