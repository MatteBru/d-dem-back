# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  District.create(state: Faker::Address.state_abbr, cdid: rand(1..5))
end

36.times do
  u = User.create(name: Faker::Name.name, username: Faker::Internet.user_name, password: Faker::Internet.password, district: District.all.sample)
  puts u.name
end

User.all.each do |u|
  u.created_issues.create(title: Faker::VForVendetta.quote.split[0,3].join(' ') + '?', blurb: Faker::VForVendetta.quote, category: 'fake news')
end

User.all.each do |u|
  u.created_issues.each do |i|
    u.stances.create(importance: rand(1..5), view: u.created_views.create(issue: u.created_issues.first, description: Faker::VForVendetta.quote, attitude: rand(1..5)))
  end
end

User.all.each do |u|
  u.stances.create(importance: rand(1..5), view: u.created_views.create(issue: Issue.all.sample, description: Faker::VForVendetta.quote, attitude: rand(1..5)))
end

User.all.each do |u|
  5.times do
    i = Issue.all.sample
    u.stances.create(importance: rand(1..5), view: i.views.sample)
  end
end
