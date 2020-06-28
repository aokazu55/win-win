require 'rails_helper'

RSpec.describe 'サービス機能', type: :model do
  let!(:user) { User.create(name: "testman", email: "test@test.org", password: "testdesu", id: "1") }
  let!(:service_1) { Service.create(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', period_start: '2025-6-29', period_end: '2025-6-29', remark: 'test11', transportation_expenses: '無料', user_id: '1') }
  # let!(:service_2) { Service.create(main_service_id: '聞く', service_detail_id: 'アイドル', service_name: 'ウンチク', confidence_level_id: '日本で5本の指に入る', price: '10000', working_time: '25', period_start: '2030-6-29', period_end: '2031-6-29', remark: 'test22', transportation_expenses: '2000') }
  
  describe 'バリデーションテスト' do
    it '「main_service_id」が空ならバリデーションは通らない' do
      blank_main_servicd_id = Service.new(main_service_id: '', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料', user_id: '1')
      expect(blank_main_servicd_id).not_to be_valid
    end

    it '「service_detail_id」が空ならバリデーションは通らない' do
      blank_service_detail_id = Service.new(main_service_id: '教える', service_detail_id: '', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(blank_service_detail_id).not_to be_valid
    end

    it '「service_name」が空ならバリデーションは通らない' do
      blank_service_name = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: '', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(blank_service_name).not_to be_valid
    end

    it '「price」が空ならバリデーションは通らない' do
      blank_price = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(blank_price).not_to be_valid
    end

    it '「working_time」が空ならバリデーションは通らない' do
      blank_working_time = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(blank_working_time).not_to be_valid
    end

    it 'confidence_level_id' do
      blank_confidence_level_id = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '', price: '100', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(blank_confidence_level_id).not_to be_valid
    end

    it '「remark」が空ならバリデーションは通らない' do
      blank_remark = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: '', transportation_expenses: '無料')
      expect(blank_remark).not_to be_valid
	end

    it 'period_start,period_end,image_id以外すべてに内容が入力されていればバリデーションは通る' do
      full_service = Service.create(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料')
      expect(full_service).not_to be_valid
    end
  end

  # describe '検索' do
  #   context 'タイトル検索テスト' do
  #     it '検索ワード：検索、1件見つかる'do
  #       expect(Service.main_service_id('1')).to include(Service.find_by(title: 'Service_1'))
  #       expect(Service.title_search('1').count).to eq 2
  #     end

  #     it '検索ワード：けんさく、1件見つかる'do
  #       expect(Service.title_search('3').count).to eq 1
  #     end
  #   end

  #   context 'ステータス検索テスト' do
  #     it '検索ワード：未着手、2件見つかる'do
  #       expect(Service.status_search("未着手").count).to eq 2
  #     end

  #     it '検索ワード：完了、1件見つかる'do
  #       expect(Service.status_search("完了").count).to eq 1
  #     end
  #   end

  #   context 'ソートテスト' do
  #     it '【完了期限でソート】すると2021が最初になる' do
  #       expect(Service.sort_deadline_asc[0].deadline).to eq "2022-03-09"
  #     end
  #     it '【優先順位でソート】を押すと「高」が最初になる' do
  #       expect(Service.sort_priority_desc[0].priority).to eq '高'
  #     end
  #   end
  # end
end