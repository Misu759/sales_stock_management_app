require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されて，パスワードが一致すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが入力されていない場合は登録できない' do
        @user.email = ''
        expect(@user).to be_invalid
      end
      it 'emailが重複する場合は登録できない' do
        @user.save
        user_duplicate_email = FactoryBot.build(:user_duplicate_email)
        expect(user_duplicate_email).to be_invalid
      end
      it 'first_nameが入力されていない場合は登録できない' do
        @user.first_name = ''
        expect(@user).to be_invalid
      end
      it 'last_nameが入力されていない場合は登録できない' do
        @user.last_name = ''
        expect(@user).to be_invalid
      end
      it 'パスワードが一致しない場合は登録できない' do
        @user.password_confirmation = 'hogehoge'
        expect(@user).to be_invalid
      end
      it 'パスワードが5文字以下の場合は登録できない' do
        @user.password = 'abc'
        @user.password_confirmation = 'abc'
        expect(@user).to be_invalid
      end
    end
  end
end
