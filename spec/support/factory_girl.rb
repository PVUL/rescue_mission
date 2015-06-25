require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title Faker::Lorem.words(8).join(' ').concat(63)
    body Faker::Lorem.paragraph(2, false, 4)
  end

  factory :answer do
    body Faker::Hacker.say_something_smart
  end

end
