require 'rails_helper'

RSpec.describe 'サービス機能', type: :model do
  let!(:user) { User.create(name: "testman", email: "test@test.org", password: "testdesu") }
  let!(:service_1) { Service.create(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料') }
  let!(:service_2) { Service.create(main_service_id: '聞く', service_detail_id: 'アイドル', service_name: 'ウンチク', confidence_level_id: '日本で5本の指に入る', price: '10000', working_time: '25', remark: 'test22', transportation_expenses: '2000') }
  
  describe 'バリデーションテスト' do
    it '「main_service_id」が空ならバリデーションは通らない' do
      blank_main_servicd_id = Service.new(main_service_id: '', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(blank_main_servicd_id).not_to be_valid
    end

    it '「service_detail_id」が空ならバリデーションは通らない' do
      blank_service_detail_id = Service.new(main_service_id: '教える', service_detail_id: '', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(blank_service_detail_id).not_to be_valid
    end

    it '「service_name」が空ならバリデーションは通らない' do
      blank_service_name = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: '', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(blank_service_name).not_to be_valid
      #マイグレーションファイル変更しないと多分解消されない
    end

    it '「price」が空ならバリデーションは通らない' do
      blank_price = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(blank_price).not_to be_valid
    end

    it '「working_time」が空ならバリデーションは通らない' do
      blank_working_time = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '', remark: 'test11', transportation_expenses: '無料')
      expect(blank_working_time).not_to be_valid
    end

    it 'confidence_level_id' do
      blank_confidence_level_id = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(blank_confidence_level_id).not_to be_valid
    end

    it '「remark」が空ならバリデーションは通らない' do
      blank_remark = Service.new(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: '', transportation_expenses: '無料')
      expect(blank_remark).not_to be_valid
	end

    it 'period_start,period_end,image_id以外すべてに内容が入力されていればバリデーションは通る' do
      not_empty_service = Service.create(main_service_id: '教える', service_detail_id: 'あいさつ', service_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '100', working_time: '2', remark: 'test11', transportation_expenses: '無料')
      expect(not_empty_service).not_to be_valid
    end
  end
end