# require 'rails_helper'

# RSpec.describe 'Users', type: :system do
#   before do
#     @user = User.create(email: "jai@test.com", password: "testdesu")
#   end

#   it 'ユーザーログイン登録が完了する' do
#     # User編集画面を開く
#     visit new_user_session_path(@user)
#     # Nameに"いとう"が入力されていることを検証する
#     expect(page).to email_field 'メールアドレス', with: 'jai@test.com'

#     # 更新実行
#     click_button 'Sign in'

#     # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
#     expect(page).to have_content 'ログインしました。'
#   end
# end

require 'rails_helper'

RSpec.describe 'ユーザー登録・ログイン・ログアウト機能' do
	before do
		@user = User.create(name: "testwoman", email: "testwoman@test.com", password: "testdesu", password_confirmation: "testdesu" )
	end

	def sign_up
		visit new_user_registration_path
		fill_in 'name', with: 'testman'
		fill_in 'email', with: 'testman@test.com'
		fill_in 'password', with: 'testdesu'
		fill_in 'password_confirmation', with: 'testdesu'
		click_on 'Sign up'
	end

		describe 'ユーザー登録テスト' do
			context 'メールアドレスの重複登録をしようとした場合' do
			it '登録済みのメールアドレスは登録出来ない' do
				visit new_user_registration_path(@user)
				fill_in 'name', with: 'nobita'
				fill_in 'email', with: 'testman@test.com'
				fill_in 'password', with: 'testdesu'
				fill_in 'password_confirmation', with: 'testdesu'
				click_on 'Sign up'
				expect(page).to have_content('メールアドレスはすでに存在します')
				# byebug
			end
		end
	end

#   describe 'ログイン・ログアウト時テスト' do
#     before do
#       login
#     end

#     context 'ログイン後、ログアウトした場合' do
#       it '自動でユーザーページへ飛び、ログイン成功のメッセージが出る' do
#         expect(page).to have_content 'ログインしました'
#         expect(page).to have_content 'wasuretemouta1@gmai.com'
#         # byebug
#       end

#       it 'ログアウトしましたと表示される' do
#         visit tasks_path
#         click_on 'ログアウト'
#         expect(page).to have_content 'ログアウトしました'
#         # byebug
#       end
#     end

#     context 'ログイン状態でユーザー登録画面へ遷移した場合' do
#       it 'タスク一覧画面へ遷移する' do
#         visit tasks_path
#         expect(page).to have_content 'タスク一覧'
#       end
#     end
#   end

#   describe '管理者権限テスト' do
#     before do
#       login_admin
#     end

#     context '管理者権限でログインした場合' do
#       it 'ユーザー管理画面に遷移できる' do
#         click_on "ユーザー管理"
#         visit admin_users_path
#         expect(page).to have_content "Administrator_View"
#       end

#       it 'ユーザー情報の更新ができる' do
#         visit edit_admin_user_path(2)
#         select "administrator", from: 'user[admin]'
#         fill_in 'user[password]', with: "kazuyasu55"
#         fill_in 'user[password_confirmation]', with: "kazuyasu55"
#         click_on "更新する"
#         # visit admin_users_path
#         expect(page).to have_content "ユーザー【 wasuretemouta2 】の更新をしました"
#         # byebug
#       end
#     end

#     context '管理者が一人しかいない状態で権限の変更をした場合' do
#       it '権限の変更はできない' do
#         visit edit_admin_user_path(2)
#         select "public_user", from: 'user[admin]'
#         fill_in 'user[password]', with: "kazuyasu55"
#         fill_in 'user[password_confirmation]', with: "kazuyasu55"
#         click_on "更新する"
#         expect(page).to have_content "ユーザー【 wasuretemouta2 】の権限以外を更新しました　※管理者は最低一人必要です"
#       end
#     end
#   end
end