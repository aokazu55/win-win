require 'rails_helper'

RSpec.describe 'サービス機能', type: :system do
	let!(:user) { FactoryBot.create(:user) }
	let!(:service) { FactoryBot.create(:service, user: user) }

	# describe 'ログイン画面' do
	# 	context '必要項目を入力して、サインインボタンを押した場合' do
	# 		it 'ログインされること' do
	# 			visit new_user_session_path
	# 			fill_in 'user[email]', with: 'testman@test.com'
	# 			fill_in 'user[password]', with: "testdesu"
	# 			click_on 'Sign in'
	# 			visit services_path
	# 			expect(page).to have_content 'testman'
	# 			# byebug
	# 		end
	# 	end
	# end

	# describe 'サービス登録画面' do
	# 	context '必要項目を入力して、createボタンを押した場合' do
	# 		it 'サービスデータが保存されること' do
	# 			visit new_user_session_path
	# 			fill_in 'user[email]', with: 'testman@test.com'
	# 			fill_in 'user[password]', with: "testdesu"
	# 			click_on 'Sign in'
	# 			visit new_service_path
	# 			# byebug
	# 			select '教わる', from: 'service[main_service_id]'
	# 			select 'アイドル', from: 'service[service_detail_id]'
	# 			select '日本で5本の指に入る', from: 'service[confidence_level_id]'
	# 			fill_in 'service[service_name]', with: 'testサービス'
	# 			fill_in 'service[price]', with: '150'
	# 			fill_in 'service[working_time]', with: '15分'
	# 			fill_in 'service[remark]', with: 'お試し期間です。'
	# 			select '2025', from: 'service[period_start(1i)]'
	# 			select '6', from: 'service[period_start(2i)]'
	# 			select '27', from: 'service[period_start(3i)]'
	# 			select '2025', from: 'service[period_end(1i)]'
	# 			select '6', from: 'service[period_end(2i)]'
	# 			select '27', from: 'service[period_end(3i)]'
	# 			fill_in 'service[remark]', with: 'test11'
	# 			fill_in 'service[transportation_expenses]', with: '無料'
	# 			click_on '投稿'
	# 			expect(page).to have_content '教わる'
	# 			expect(page).to have_content 'アイドル'
	# 			expect(page).to have_content '日本で5本の指に入る'
	# 			expect(page).to have_content "testサービス"
	# 			expect(page).to have_content "150"
	# 		end
	# 	end

	# 	context 'サービスを作成した場合' do
	# 		it '一覧画面で作成済みのタスクが表示されること' do
	# 			visit services_path
	# 			byebug
	# 			expect(page).to have_content '教える'
	# 			expect(page).to have_content 'あいさつ'
	# 			expect(page).to have_content 'おはよう'
	# 			expect(page).to have_content "2日間"
	# 			expect(page).to have_content "更新"
	# 		end
	# 	end
	# end

	describe 'サービス編集画面' do
		context '必要項目を入力して、Updateボタンを押した場合' do
			it 'サービスデータが更新されること' do
				visit new_user_session_path
				fill_in 'user[email]', with: 'testman@test.com'
				fill_in 'user[password]', with: "testdesu"
				click_on 'Sign in'
				click_on 'Edit'
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
				click_on 'Update'
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'test更新'
				expect(page).to have_content "test更新やってます。"
				expect(page).to have_content "150"
				visit services_path
				byebug
				expect(page).to have_content '聞く'
				expect(page).to have_content 'アニメ'
				expect(page).to have_content 'プロレベル'
				expect(page).to have_content "test更新"
				expect(page).to have_content "150"
			end
		end

		# context 'タスクを作成した場合' do
		# 	it '作成済みのタスクが表示されること' do
		# 		visit services_path
		# 		byebug
		# 		expect(page).to have_content '教える'
		# 		expect(page).to have_content 'あいさつ'
		# 		expect(page).to have_content 'おはよう'
		# 		expect(page).to have_content "2日間"
		# 		expect(page).to have_content "更新"
		# 	end
		# end
	end


end
