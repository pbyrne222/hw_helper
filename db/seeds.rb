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

user = User.create!(name:                  "Admin",
                    email:                 "user@example.org",
                    password:              "password",
                    password_confirmation: "password")

other_users = Array.new(10).map { |_| User.create!(name:                  Faker::Name.name,
                                                   email:                 Faker::Internet.email,
                                                   password:              "password",
                                                   password_confirmation: "password") }

30.times do
	Problem.create!(description: "#{['I keep getting stuck on the', 'Can someone explain why', 'Why would the'].sample} #{Faker::Company.catch_phrase.downcase}?",
	                history:  Faker::Lorem.paragraph(sentence_count=6, supplemental=false, random_sentences_to_add=3),
	                user:  user,
									created_at: rand(1.year).ago,)
end

problems = Problem.all

50.times do
	Note.create!(problem: problems.sample,
	             text:     Faker::Hacker.say_something_smart,
	             user:     other_users.sample)
end
