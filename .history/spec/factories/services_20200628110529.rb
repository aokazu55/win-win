FactoryBot.define do
  factory :service do
    main_service_id { "教える" }
    service_detail_id { "あいさつ" }
    service_name { "おはよう" }
    # image_id { "MyString" }
    confidence_level_id { "世界で5本の指に入る" }
    price { "100" }
    working_time { "2日間" }
    period_start { "2025-06-27" }
    period_end { "2025-06-27" }
    remark { "test11" }
    transportation_expenses { "無料" }
    user { "10" }
  end
end
