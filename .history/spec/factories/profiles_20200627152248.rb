FactoryBot.define do
  factory :profile do
    nickname { "MyString" }
    date_of_birth { "2020-06-27" }
    gender_id { "MyString" }
    address_id { "MyString" }
    personality_id { "MyString" }
    special_skill_id { "MyString" }
    introduce { "MyText" }
    user { nil }
  end
end
