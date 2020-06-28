require 'rails_helper'

RSpec.describe 'プロフィール機能', type: :model do
  # let!(:user) { User.create(name: "testman", email: "test@test.org", password: "testdesu") }
  # let!(:profile_1) { Profile.create(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '千葉県', personality_id: '真面目', special_skill_id: '家事', introduce: 'test1') }
  # let!(:profile_2) { Profile.create(nickname: 'ネーム', date_of_birth: '1981年3月10日', gender_id: '女性', address_id: '東京都', personality_id: 'さわやか', special_skill_id: '料理', introduce: 'test2') }

  describe 'バリデーションテスト' do
    it '「nickname」が空ならバリデーションは通らない' do
      blank_nickname = Profile.new(nickname: 'テスト', date_of_birth: '1981-3-9', gender_id.name: '男性', address_id.name: '北海道', personality_id.name: '真面目', special_skill_id.name: '家事', introduce: 'test1')
      expect(blank_nickname).to be_valid
    end

  #   it '「price」が空ならバリデーションは通らない' do
  #     blank_date_of_birth = Profile.new(nickname: 'ニック', date_of_birth: '', gender_id: '男性', address_id: '千葉県', personality_id: '真面目', special_skill_id: '家事', introduce: 'test1')
  #     expect(blank_date_of_birth).not_to be_valid
  #   end

  #   it '「gender_id」が空ならバリデーションは通らない' do
  #     blank_gender_id = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '', address_id: '千葉県', personality_id: '真面目', special_skill_id: '家事', introduce: 'test1')
  #     expect(blank_gender_id).not_to be_valid
  #   end

  #   it '「address_id」が空ならバリデーションは通らない' do
  #     blank_address_id = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '', personality_id: '真面目', special_skill_id: '家事', introduce: 'test1')
  #     expect(blank_address_id).not_to be_valid
  #   end

  #   it '「personality_id」が空ならバリデーションは通らない' do
  #     blank_personality_id = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '千葉県', personality_id: '', special_skill_id: '家事', introduce: 'test1')
  #     expect(blank_personality_id).not_to be_valid
	# end

  #   it '「special_skill_id」が空ならバリデーションは通らない' do
  #     blank_special_skill_id = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '千葉県', personality_id: '真面目', special_skill_id: '', introduce: 'test1')
  #     expect(blank_special_skill_id).not_to be_valid
  #   end

  #   it '「introduce」が空ならバリデーションは通らない' do
  #     blank_introduce = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '千葉県', personality_id: '真面目', special_skill_id: '家事', introduce: '')
  #     expect(blank_introduce).not_to be_valid
  #   end

  #   it '「全て」が入力されていればバリデーションは通る' do
  #     full_profile = Profile.new(nickname: 'ニック', date_of_birth: '1981年3月9日', gender_id: '男性', address_id: '千葉県', personality_id: '真面目', special_skill_id: '家事', introduce: 'test1')
  #     expect(full_profile).to be_valid
  #   end
	end
end