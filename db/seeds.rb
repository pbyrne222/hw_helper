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

user = User.create!(name:                  "Faker::Name.name",
                    email:                 "user@example.org",
                    password:              "password",
                    password_confirmation: "password")

other_users = Array.new(10).map { |_| User.create!(name:                  Faker::Name.name,
                                                   email:                 Faker::Internet.email,
                                                   password:              "password",
                                                   password_confirmation: "password") }


10.times do
	user = User.create!(name: Faker::Name.name,
	                    email: Faker::Internet.free_email,
	                    password: "password",
	                    password_confirmation: "password")

	rand(2..5).times do
		Problem.create!(description: "#{["I'm wondering how the",
		                                 'Can someone explain why a',
		                                 'Why would the'].sample}
																	#{Faker::Company.catch_phrase.downcase}
																	#{['keeps breaking',
																	   "won't work",
																	   'is stuck in a loop'].sample}?",
		                history:  Faker::Lorem.paragraph(sentence_count=10, supplemental=false, random_sentences_to_add=3),
		                user:  user,
		                created_at: rand(1.year).ago,)
	end
end

problems = Problem.all
users = User.all.pluck("id")

problems.each do |problem|
	rand(0..5).times do
	problem.notes.create!(text:     Faker::Hacker.say_something_smart,
	                      user:     User.find(users.sample))
	end
end
