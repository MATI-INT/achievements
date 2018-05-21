# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  cat = Category.create title: Faker::LordOfTheRings.location,
                        description: Faker::Lorem.sentence
  10.times do
    cat.posts.create title: Faker::LordOfTheRings.location,
                     body: Faker::Lorem.sentence,
                     user: User.first
  end

  5.times do
    User.create email: Faker::Internet.email,
                name: Faker::LordOfTheRings.character,
                password: 'P@ssw0rdS', password_confirmation: 'P@ssw0rdS'
  end

  puts 'finished creating objects...'
end

400.times do
  post = Post.all.shuffle.first
  Visit.create created_at: Faker::Date.between(60.days.ago, Date.today),
               user: User.all.shuffle.first,
               post: post
end

200.times do
  category = Category.all.shuffle.first
  Visit.create created_at: Faker::Date.between(60.days.ago, Date.today),
               user: User.all.shuffle.first,
               category: category
end

