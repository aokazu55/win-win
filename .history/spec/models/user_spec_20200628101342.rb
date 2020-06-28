require 'rails_helper'

RSpec.describe 'サービス機能', type: :model do
  describe 'バリデーションテスト' do
    it '「name」が空ならバリデーションは通らない' do
      blank_user_name = User.new(name: '', email: 'test@test.com', password: 'testdesu', password_confirmation: 'testdesu')
      expect(blank_user_name).not_to be_valid
    end

    it '「email」が空ならバリデーションは通らない' do
      blank_user_email = User.new(name: 'test', email: '', password: 'testdesu', password_confirmation: 'testdesu')
      expect(blank_user_email).not_to be_valid
    end

    it '「password」が空ならバリデーションは通らない' do
      blank_user_password = User.new(name: 'test', email: 'test@test.com', password: '', password_confirmation: 'testdesu')
      expect(blank_user_password).to be_valid
    end

    # it '「price」が空ならバリデーションは通らない' do
    #   blank_price = user.new(main_user_id: '教える', user_detail_id: 'あいさつ', user_name: 'おはよう', confidence_level_id: '世界で5本の指に入る', price: '', working_time: '2', working_time: '2', period_start: '2030-6-29', period_end: '20-6-29', remark: 'test11', transportation_expenses: '無料', user_id: '1')
    #   expect(blank_price).not_to be_valid
    # end
  end
end