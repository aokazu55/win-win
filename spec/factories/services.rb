FactoryBot.define do
  factory :service do
    main_service_id { "MyString" }
    service_detail_id { "MyString" }
    service_name { "MyString" }
    image_id { "MyString" }
    confidence_level_id { "MyString" }
    price { 1 }
    working_time { "MyString" }
    period_start { "2020-06-27" }
    period_end { "2020-06-27" }
    remark { "MyText" }
    transportation_expenses { "MyString" }
    user { nil }
  end
end
