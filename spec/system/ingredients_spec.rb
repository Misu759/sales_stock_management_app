require 'rails_helper'

RSpec.describe "Ingredients", type: :system do
  let!(:user) { create(:user) }
  let!(:supplier) { create(:supplier) }
  before do
    login_as(user)
  end

  describe '新規登録' do
    context 'フォームの入力値が正常' do
      it '食材の登録が成功する' do
        visit new_ingredient_path
        fill_in 'ingredient[name]', with: 'テスト'
        fill_in 'ingredient[unit_amount]', with: 1000
        fill_in 'ingredient[purchase_cost]', with: 500
        fill_in 'ingredient[threshold]', with: 500
        find("#ingredient_supplier_id").find("option[value='1']").select_option
        click_button '登録する'
        expect(page).to have_content '食材情報を追加しました'
        expect(current_path).to eq ingredients_path
      end
    end
    context '仕入れ先の選択をしない' do
      it '食材の登録が失敗する' do
        visit new_ingredient_path
        fill_in 'ingredient[name]', with: 'テスト'
        fill_in 'ingredient[unit_amount]', with: 1000
        fill_in 'ingredient[purchase_cost]', with: 500
        fill_in 'ingredient[threshold]', with: 500
        click_button '登録する'
        expect(page).to have_content 'もう一度やり直してください'
        expect(current_path).to eq ingredients_path
      end
    end
  end
end
