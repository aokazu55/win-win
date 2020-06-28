FactoryBot.define do
  factory :user do  
    name { "testman" }
    email { "testman@test.com" }
    password { "testdesu" }
    password_confirmation { "testdesu" }
    id { 10 }
  end
end
