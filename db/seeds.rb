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



5.times do
	fake_name = Faker::Name.name
	user = User.create!(name:                   fake_name,
	                    email:                  Faker::Internet.free_email(fake_name),
	                    password:               "password",
	                    password_confirmation:  "password")

	rand(0..3).times do
		Problem.create!(description: "#{["Anyone know why the",
		                                 'Can someone explain why a',
		                                 "I don't understand why the"].sample}
																	#{Faker::Company.catch_phrase.downcase}
																	#{['keeps breaking',
																	   "won't work",
																	   'is stuck in a loop'].sample}?",
		                history:      Faker::Lorem.paragraph(sentence_count=10, supplemental=false, random_sentences_to_add=3),
		                user:         user,
		                resolved:     false,
		                created_at:   rand(3.month).ago,)
	end
end

problems = Problem.all
users = User.all.pluck("id")

problems.each do |problem|
	rand(0..5).times do
	problem.notes.create!(text: Faker::Hacker.say_something_smart,
	                      user: User.find(users.sample))
	end
end
