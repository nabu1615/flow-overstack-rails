
User.destroy_all
Question.destroy_all
Answer.destroy_all

3.times do
	User.create(email: Faker::Internet.email, password: '123456')
end


20.times do
	user = User.all.sample
	question = Question.create(user_id: user.id, title: Faker::HarryPotter.character, body: Faker::HarryPotter.quote, date: Time.now.strftime("%d/%m/%Y"))
	question.answers.create!(body: Faker::HarryPotter.quote, user_id: user.id)
end

