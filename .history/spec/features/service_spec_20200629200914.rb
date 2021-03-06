require 'rails_helper'

RSpec.describe 'サービス機能', type: :system do
	let!(:user) { FactoryBot.create(:user) }
	let!(:service) { FactoryBot.create(:service, user: user) }

	describe 'ログイン画面' do
		context '必要項目を入力して、サインインボタンを押した場合' do
			it 'ログインされること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'ログイン', match: :first
				visit services_path
				expect(page).to have_content 'testman'
			end
		end
	end

	describe 'サービス登録画面' do
		context '必要項目を入力して、登録ボタンを押した場合' do
			it 'サービスデータが保存されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				visit services_path
				click_on 'ログイン', match: :first
				visit new_service_path
				click_on 'サービス投稿', match: :first
				select '教わる', from: 'service[main_service_id]', match: :first
				select 'アイドル', from: 'service[service_detail_id]', match: :first
				select '日本で5本の指に入る', from: 'service[confidence_level_id]'
				fill_in 'service[service_name]', with: 'testサービス'
				fill_in 'service[price]', with: '150'
				fill_in 'service[working_time]', with: '15分'
				fill_in 'service[remark]', with: 'お試し期間です。'
				select '2025', from: 'service[period_start(1i)]'
				select '6', from: 'service[period_start(2i)]'
				select '27', from: 'service[period_start(3i)]'
				select '2025', from: 'service[period_end(1i)]'
				select '6', from: 'service[period_end(2i)]'
				select '27', from: 'service[period_end(3i)]'
				fill_in 'service[remark]', with: 'test11'
				fill_in 'service[transportation_expenses]', with: '無料'
				click_on '登録'
				expect(page).to have_content '教わる'
				expect(page).to have_content 'アイドル'
				expect(page).to have_content '日本で5本の指に入る'
				expect(page).to have_content "testサービス"
				expect(page).to have_content "150"
			end
		end

		context 'サービスを作成した場合' do
			it '一覧画面で作成済みのタスクが表示されること' do
				visit services_path
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
				click_on 'ログイン', match: :first
				click_on 'サービス編集', match: :first
				select '聞く', from: 'service[main_service_id]'
				select 'アニメ', from: 'service[service_detail_id]'
				select 'プロレベル', from: 'service[confidence_level_id]'
				fill_in 'service[service_name]', with: 'test更新'
				fill_in 'service[price]', with: '150'
				fill_in 'service[working_time]', with: '100時間'
				fill_in 'service[remark]', with: 'お試し期間です。'
				select '2025', from: 'service[period_start(1i)]'
				select '6', from: 'service[period_start(2i)]'
				select '27', from: 'service[period_start(3i)]'
				select '2025', from: 'service[period_end(1i)]'
				select '6', from: 'service[period_end(2i)]'
				select '27', from: 'service[period_end(3i)]'
				fill_in 'service[remark]', with: 'test更新やってます。'
				fill_in 'service[transportation_expenses]', with: '1000円'
				click_on '更新'
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'test更新'
				expect(page).to have_content "test更新やってます。"
				expect(page).to have_content "150"
				visit services_path
				# byebug
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'test更新'
				expect(page).to have_content "100時間"
				expect(page).to have_content "150"
			end
		end
	end
end
