require 'rails_helper'

RSpec.describe "Suppliers", type: :system do
  let(:user) { create(:user) }
  before do
    login_as(user)
  end
  describe '新規登録' do
    context 'フォームの入力値が正常' do
      it '仕入れ先の登録が成功する' do
        visit new_supplier_path
        fill_in "supplier[name]", with: 'テスト'
        fill_in 'supplier[phone_number]', with: '000-0000-0000'
        fill_in 'supplier[delivery_cost]', with: 500
        click_button '登録する'
        expect(page).to have_content '成功'
        expect(page).to have_content '仕入れ先詳細'
        expect(current_path).to eq supplier_path(1)
      end
    end
  end
end
