require 'rails_helper'

RSpec.describe 'サービス機能', do

  let!(:user) { FactoryBot.create(:user) }
  let!(:service) { FactoryBot.create(:service, user: user) }

  before do
    visit new_session_path
    fill_in 'email', with: 'testman@test.com'
    fill_in 'password', with: "testdesu"
    click_on 'Sign in'
    expect(page).to have_content 'testman'
  end

  describe 'サービス一覧画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
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

#     context 'タスクを作成した場合' do
#       it '作成済みのタスクが表示されること' do
#         visit tasks_path
#         # save_and_open_page
#         expect(page).to have_content 'test_task'
#         expect(page).to have_content 'test_content'
#         expect(page).to have_content '高'
#         expect(page).to have_content '未着手'
#         expect(page).to have_content '2022-03-09'
#       end
#     end

#     context '複数のタスクを作成した場合' do
#       it 'タスクが作成日時の降順に並んでいること' do
#         visit tasks_path
#         task_list = page.all('tr')
#         expect(task_list[1]).to have_content 'test_task'
#         expect(task_list[2]).to have_content 'test_task2'
#         expect(task_list[3]).to have_content 'test_task3'
#       end
#     end

#     context '【完了期限でソート】をクリックした場合' do
#       it 'タスクが完了期限順に並んでいること' do
#         visit tasks_path
#         click_link '【完了期限でソート】'
#         expect(page).to have_content '現在のログインユーザー'
#         task_list = page.all('tr')
#         # byebug
#         expect(task_list[1]).to have_content '2022-01-05'
#         expect(task_list[2]).to have_content '2022-03-09'
#         expect(task_list[3]).to have_content '2022-12-09'
#       end
#     end

#     context '検索・ソート機能' do
#       it 'タイトルのみの検索結果が出ること' do
#         visit tasks_path
#         # save_and_open_page
#         fill_in 'task[title]', with: 'test_task2'
#         click_on '検索はコチラ'
#         task_list = page.all('tr')
#         expect(task_list[1]).to have_content 'test_task2'
#         expect(task_list).not_to have_content 'test_task3'
#       end

#       it 'ステータスのみ検索結果に出ること' do
#         visit tasks_path
#         select '未着手', from: 'task[status]'
#         click_on '検索はコチラ'
#         task_list = page.all('tr')
#         # byebug
#         expect(task_list[1]).to have_content '未着手'
#         expect(task_list).not_to have_content '着手中'
#       end

#       it 'タイトル・ステータス共に検索して1件' do
#         visit tasks_path
#         fill_in 'task[title]', with: 'test_task3'
#         select '着手中', from: 'task[status]'
#         click_on '検索はコチラ'
#         task_list = page.all('tr')
#         expect(task_list[1]).to have_content 'test_task3', '着手中'
#         # save_and_open_page
#         expect(task_list).not_to have_content 'test_task2', '着手中'
#       end
#     end
#   end
end
