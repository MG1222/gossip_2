require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

puts "clean"

city_1 = City.create(name: 'Bordeaux', zip_code: "33000")
city_2 = City.create(name: 'Limoges', zip_code: "87000")
city_3 = City.create(name: 'Paris', zip_code: "75000")
city_4 = City.create(name: 'St.Paul', zip_code: "87260")



20.times do
  city = [city_1, city_2, city_3, city_4].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: Faker::Internet.email, age: rand(18..35), city_id: city.id)
 
  gossip_1 = Gossip.create(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 120, supplemental: true), user_id: user.id)
  gossip_2 = Gossip.create(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 120, supplemental: true), user_id: user.id)

  tag = Tag.create(title: "#{Faker::Verb.base}")
  tag.save

  gossip_1.tags << tag
  gossip_2.tags << tag
end
puts "ok"

6.times do |index|
  content = Faker::Hipster.sentence
  sender = User.all.sample

  recipient_array = User.all.reject{ |user| user == sender }.sample(rand(1..3))
  recipient_array.each do |recipient|
    PrivateMessage.create!(
      content: content,
      sender: sender,
      recipient: recipient
    )
  end
end
puts "ok"