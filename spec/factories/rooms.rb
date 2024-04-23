FactoryBot.define do
  Faker::Config.locale = :ja
  factory :room do
      room_name {Faker::Book.title}
      group_memo {Faker::Lorem.sentence(word_count: 3)}
  end
end
