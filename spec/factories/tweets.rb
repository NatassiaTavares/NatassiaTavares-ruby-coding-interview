FactoryBot.define do
  factory :tweet do
    body { Faker::GreekPhilosophers.quote }
    user
  end
end
