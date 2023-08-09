# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1500.times do
  user = FactoryBot.create(:user)
  3.times do
    random_body = [Faker::GreekPhilosophers.quote , Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote]
    FactoryBot.create(:tweet, body: random_body.sample, user: user)
  end
end

