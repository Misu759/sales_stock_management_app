require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'user[last_name]', with: 'last_name'
          fill_in 'user[first_name]', with: 'first_name'
          fill_in 'user[email]', with: 'email@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する'
          expect(current_path).to eq root_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'user[last_name]', with: 'last_name'
          fill_in 'user[first_name]', with: 'first_name'
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'もう一度やり直してください'
          expect(current_path).to eq users_path
        end
      end


      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'user[last_name]', with: 'last_name'
          fill_in 'user[first_name]', with: 'first_name'
          fill_in 'user[email]', with: existed_user.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する'
          expect(page).to have_content 'もう一度やり直してください'
          expect(current_path).to eq users_path
        end
      end
    end

  end

  # describe 'ログイン後' do
  #   before { login_as(user) }

    # describe 'ユーザー編集' do
    #   context 'フォームの入力値が正常' do
    #     it 'ユーザーの編集が成功する' do

    #     end
    #   end

    #   context 'メールアドレスが未入力' do
    #     it 'ユーザーの編集が失敗する' do

    #     end
    #   end

    #   context '登録済のメールアドレスを使用' do
    #     it 'ユーザーの編集が失敗する' do

    #     end
    #   end

    #   context '他ユーザーの編集ページにアクセス' do
    #     let!(:other_user) { create(:user, email: "other_user@example.com") }

    #     it '編集ページへのアクセスが失敗する' do

    #     end
    #   end
    # end

  # end
end