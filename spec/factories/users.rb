FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    sequence(:username) { |n| "#{Faker::Internet.username}_#{n}" }
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }
    password { "password" }
    password_confirmation { "password" }
    company { create(:company) }
  end
end
