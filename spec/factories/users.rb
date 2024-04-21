FactoryBot.define do
  Faker::Config.locale = :ja
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation {password}
    profile {Faker::Lorem.sentence(word_count: 3)}
  end
end
