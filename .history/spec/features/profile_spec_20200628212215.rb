require 'rails_helper'

RSpec.describe 'サービス機能', type: :system do
	let!(:user) { FactoryBot.create(:user) }
	let!(:profile) { FactoryBot.create(:profile, user: user) }

	describe 'ログイン画面' do
		context '必要項目を入力して、サインインボタンを押した場合' do
			it 'ログインされること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				visit services_path
				expect(page).to have_content 'testman'
			end
		end
	end

	describe 'プロフィール登録画面' do
		context '必要項目を入力して、登録ボタンを押した場合' do
			it 'プロフィールデータが保存されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				click_on 'Create Profile'
				# visit new_profile_path
				byebug
				fill_in 'profile[nickname]', with: '昼寝の天才'
				select '2010', from: 'profile[date_of_birth(1i)]'
				select '6', from: 'profile[date_of_birth(2i)]'
				select '27', from: 'profile[date_of_birth(3i)]'
				select '男性', from: 'profile[main_gender_id]'
				select '東京都', from: 'profile[profile_address_id]'
				select 'ぐうたら', from: 'profile[personality_id]'
				select '射的', from: 'profile[special_skill_id]'
				fill_in 'profile[introduce]', with: 'どら焼き大好き'
				click_on '登録'
				expect(page).to have_content '昼寝の天才'
				expect(page).to have_content '2010-6-27'
				expect(page).to have_content '男性'
				expect(page).to have_content "東京都"
				expect(page).to have_content "ぐうたら"
				expect(page).to have_content "射的"
				expect(page).to have_content "どら焼き大好き"
				expect(page).to have_content "testman"
			end
		end
	end

	describe 'プロフィール編集画面' do
		context '必要項目を入力して、更新ボタンを押した場合' do
			it 'プロフィールデータが更新されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				click_on 'プロフィール編集'
				# visit new_profile_path
				fill_in 'profile[nickname]', with: '更新したよ'
				select '2020', from: 'profile[date_of_birth(1i)]'
				select '6', from: 'profile[date_of_birth(2i)]'
				select '29', from: 'profile[date_of_birth(3i)]'
				select '男性', from: 'profile[main_gender_id]'
				select '東京都', from: 'profile[profile_address_id]'
				select 'さわやか', from: 'profile[personality_id]'
				select 'スポーツ', from: 'profile[special_skill_id]'
				fill_in 'profile[introduce]', with: '更新成功！'
				click_on '登録'
				expect(page).to have_content '更新したよ'
				expect(page).to have_content '2020-6-29'
				expect(page).to have_content '男性'
				expect(page).to have_content "東京都"
				expect(page).to have_content "さわやか"
				expect(page).to have_content "スポーツ"
				expect(page).to have_content "更新成功！"
				expect(page).to have_content "testman"
			end
		end
	end
end