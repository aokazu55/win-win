FactoryBot.define do
  factory :favorite do
    follower_id { 1 }
    followed_id { 1 }
  end
end
