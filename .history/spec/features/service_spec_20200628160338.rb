require 'rails_helper'

RSpec.describe 'サービス機能', type: :system do
	let!(:user) { FactoryBot.create(:user) }
	let!(:service) { FactoryBot.create(:service, user: user) }

	before do
		visit new_user_session_path
		fill_in 'user[email]', with: 'testman@test.com'
		fill_in 'user[password]', with: "testdesu"
		click_on 'Sign in'
		expect(page).to have_content 'testman'
	end

	describe 'サービス登録画面' do
		context '必要項目を入力して、createボタンを押した場合' do
			it 'データが保存されること' do
				visit new_service_path
				select 'service[main_service_id]', from: '教わる'
				select 'service[service_detail_id]', from: 'アイドル'
				select 'service[confidence_level_id]', from: '日本で5本の指に入る'
				fill_in 'service[service_name]', with: 'testサービス'
				fill_in 'service[price]', with: '150'
				fill_in 'service[working_time]', with: '15分'
				fill_in 'service[remark]', with: 'お試し期間です。'
				select "service[period_start]", from: "Date.new(2025-06-27)"
				select "service[period_end]", from: "Date.new(2025-06-27)"
				fill_in 'service[remark]', with: 'test11'
				fill_in 'service[transportation_expenses]', with: '1無料'
				click_on '投稿'
				expect(page).to have_content '教わる'
				expect(page).to have_content 'アイドル'
				expect(page).to have_content '日本で5本の指に入る'
				expect(page).to have_content "testサービス"
				expect(page).to have_content "150"
			end
		end
	end


end
