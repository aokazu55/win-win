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
      expect(blank_user_password).not_to be_valid
    end

    it '「password_confirmation」が空ならバリデーションは通らない' do
      blank_user_password_confirmation = User.new(name: 'test', email: 'test@test.com', password: 'testdesu', password_confirmation: '')
      expect(blank_user_password_confirmation).not_to be_valid
    end

    it '「image」が空でもバリデーションは通る' do
      blank_user_password_confirmation = User.new(name: 'test', email: 'test@test.com', password: 'testdesu', password_confirmation: 'testdesu', image_id: '')
      expect(blank_user_password_confirmation).to be_valid
    end

    it 'image以外ユーザー情報全てが入力されていて、かつ、パスワードが一致していればバリデーションは通る' do
      full_user = User.new(name: 'test', email: 'test@test.com', password: 'testdesu', password_confirmation: 'testdesu', image_id: '')
      expect(full_user).to be_valid
    end
  end
end