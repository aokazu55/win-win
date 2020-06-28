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
				visit profiles_path
				expect(page).to have_content 'testman'
				# byebug
			end
		end
	end

	describe 'サービス登録画面' do
		context '必要項目を入力して、登録ボタンを押した場合' do
			it 'サービスデータが保存されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				visit new_profile_path
				# byebug
				fill_in 'profile[nick_name]', with: '昼寝の天才'
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

		context 'サービスを作成した場合' do
			it '一覧画面で作成済みのタスクが表示されること' do
				visit profiles_path
				expect(page).to have_content '教える'
				expect(page).to have_content 'あいさつ'
				expect(page).to have_content 'おはよう'
				expect(page).to have_content "2日間"
				expect(page).to have_content "更新"
			end
		end
	end

	describe 'サービス編集画面' do
		context '必要項目を入力して、更新ボタンを押した場合' do
			it 'サービスデータが更新されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				click_on 'サービス編集'
				select '聞く', from: 'profile[main_profile_id]'
				select 'アニメ', from: 'profile[profile_detail_id]'
				select 'プロレベル', from: 'profile[confidence_level_id]'
				fill_in 'profile[profile_name]', with: 'test更新'
				fill_in 'profile[price]', with: '150'
				fill_in 'profile[working_time]', with: '100時間'
				fill_in 'profile[remark]', with: 'お試し期間です。'
				select '2025', from: 'profile[period_start(1i)]'
				select '6', from: 'profile[period_start(2i)]'
				select '27', from: 'profile[period_start(3i)]'
				select '2025', from: 'profile[period_end(1i)]'
				select '6', from: 'profile[period_end(2i)]'
				select '27', from: 'profile[period_end(3i)]'
				fill_in 'profile[remark]', with: 'test更新やってます。'
				fill_in 'profile[transportation_expenses]', with: '1000円'
				click_on '更新'
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'test更新'
				expect(page).to have_content "test更新やってます。"
				expect(page).to have_content "150"
				visit profiles_path
				# byebug
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'test更新'
				expect(page).to have_content "100時間"
				expect(page).to have_content "150"
			end
		end
	end