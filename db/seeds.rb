# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reaction.delete_all
Kudo.delete_all
Emoji.delete_all
Value.delete_all

brilliant = Value.create!(name: 'Brilliant', slug: 'brilliant')
Emoji.create!(value: brilliant, character: '🎓', alpha_code: 'value_brilliant')
Emoji.create!(value: brilliant, character: '🎓', alpha_code: 'mortar_board')

hardworking = Value.create!(name: 'Hardworking', slug: 'hardworking')
Emoji.create!(value: hardworking, character: '💪', alpha_code: 'value_hardworking')
Emoji.create!(value: hardworking, character: '💪', alpha_code: 'muscle')

kind = Value.create!(name: 'Kind', slug: 'kind')
Emoji.create!(value: kind, character: '❤️', alpha_code: 'value_kind')
Emoji.create!(value: kind, character: '❤️', alpha_code: 'heart')

values = [brilliant, hardworking, kind]
users = %w(caitlin kmars jjustice strickland)
channels = %w(serious-business serious-coding ios-and-mac backend web lunch halp thanks blog-wranglin)

kudos = []

100.times do
  from_user = users.sample
  to_user = (users - [from_user]).sample
  description = Faker::Lorem.sentence
  channel = channels.sample
  timestamp = Faker::Number.decimal(9, 6)

  kudo = Kudo.create(from_user: from_user, to_user: to_user, description: description, channel: channel, timestamp: timestamp)
  kudos.push(kudo)
end

randomized_values = values - [brilliant]
randomized_values.each do |value|
  users.each do |to_user|
    points = Random.rand(100)
    puts "Assigning #{points} #{value.slug} points to #{to_user}"
    points.times do
      from_user = (users - [to_user]).sample
      kudo = kudos.select { |k| k.to_user == to_user }.sample
      Reaction.create!(kudo: kudo, value: value, from_user: from_user)
    end
  end
end

# hard-coded brilliant values
brilliant_points = {'caitlin' => 75, 'kmars' => 76, 'strickland' => 57, 'jjustice' => 34}
brilliant_points.each_pair do |to_user, points|
  puts "Assigning #{points} brilliant points to #{to_user}"
  points.times do
    from_user = (users - [to_user]).sample
    kudo = kudos.select { |k| k.to_user == to_user }.sample
    reaction = Reaction.create!(kudo: kudo, value: brilliant, from_user: from_user)
  end
end
