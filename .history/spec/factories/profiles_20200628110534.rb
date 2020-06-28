FactoryBot.define do
  factory :profile do
    nickname { "昼寝の天才" }
    date_of_birth { "2010-06-27" }
    gender_id { "男性" }
    address_id { "東京都" }
    personality_id { "ぐうたら" }
    special_skill_id { "射的" }
    introduce { "どら焼き大好き" }
    user { "10" }
  end
end
