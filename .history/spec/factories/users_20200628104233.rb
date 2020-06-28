FactoryBot.define do
  factory :user do  
    name: { testman }
    email: { testman@test.com }
    password: { testdesu }
    password_confirmation: { testdesu }
  end
end
