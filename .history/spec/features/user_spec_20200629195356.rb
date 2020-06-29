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
		click_on '会員登録'
	end

		describe 'ユーザー登録テスト' do
			context 'メールアドレスの重複登録をしようとした場合' do
			it '登録済みのメールアドレスは登録出来ない' do
				visit new_user_registration_path
				fill_in 'name', with: 'nobita'
				fill_in 'email', with: 'nobi@test.com'
				fill_in 'password', with: 'testdesu'
				fill_in 'user[password_confirmation]', with: 'testdesu'
				click_on 'ログイン'
				visit new_user_registration_path
			end
		end
	end

	describe 'ログイン・ログアウト時テスト' do
		before do
			visit new_user_session_path
			fill_in 'email', with: 'test@test.com'
			fill_in 'password', with: 'testdesu'
			click_on 'Sign In'
		end

		context 'ログインした場合' do
			it 'ユーザーページへ飛び詳細画面が表示される' do
				visit user_path(@user)
			end
		end

		context 'ログイン状態でユーザー登録画面へ遷移した場合' do
		it 'サービス一覧画面へ遷移する' do
			visit services_path
			expect(page).to have_content 'サービス一覧'
			end
		end

		context 'ログイン状態で「users」をクリックした場合' do
		it 'ユーザー一覧画面へ遷移する' do
			visit users_path
			end
		end

		context 'ログイン状態で「sevices」をクリックした場合' do
		it 'サービス一覧画面へ遷移する' do
			visit services_path
			expect(page).to have_content 'サービス一覧'
			end
		end

		context 'ログイン状態で「Create Profile」をクリックした場合' do
		it 'プロフィール登録画面へ遷移する' do
			visit new_profile_path
			end
		end

		context 'ログイン状態で「サービス投稿」をクリックした場合' do
		it 'サービス登録画面へ遷移する' do
			visit new_service_path
			end
		end

		context 'ログアウトした場合' do
			it 'サービスページへ飛びサービス一覧が表示される' do
				visit services_path
				expect(page).to have_content 'サービス一覧'
			end
		end
	end
end