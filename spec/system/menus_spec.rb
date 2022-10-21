require 'rails_helper'

RSpec.describe "Menus", type: :system do
  let(:user) { create(:user) }
  let!(:ingredient) { create(:ingredient)}
  before do
    login_as(user)
  end
  describe '新規登録' do
    context '全ての項目を入力' do
      it 'メニューの登録が成功する' do
        visit new_menu_path
        fill_in "menu[name]", with: 'テスト'
        fill_in 'menu[regular_cost]', with: 500
        find("#menu_category").find("option[value='sweets']").select_option
        fill_in 'menu[ingredient_number]', with: 3
        click_button '登録する'
        expect(page).to have_content 'メニュー情報を追加しました'
        expect(current_path).to eq new_menu_ingredient_path(1)
      end
    end
    context 'regular_costが未入力' do
      it 'メニューの登録が成功する' do
        visit new_menu_path
        fill_in "menu[name]", with: 'テスト'
        find("#menu_category").find("option[value='sweets']").select_option
        fill_in 'menu[ingredient_number]', with: 3
        click_button '登録する'
        expect(page).to have_content 'メニュー情報を追加しました'
        expect(current_path).to eq new_menu_ingredient_path(1)
      end
    end
    context 'categoryが未入力' do
      it 'メニューの登録が成功する' do
        visit new_menu_path
        fill_in "menu[name]", with: 'テスト'
        fill_in 'menu[regular_cost]', with: 500
        fill_in 'menu[ingredient_number]', with: 3
        click_button '登録する'
        expect(page).to have_content 'メニュー情報を追加しました'
        expect(current_path).to eq new_menu_ingredient_path(1)
      end
    end

    # 異常
    context 'nameが未入力' do
      it 'メニューの登録が失敗する' do
        visit new_menu_path
        fill_in 'menu[regular_cost]', with: 500
        find("#menu_category").find("option[value='sweets']").select_option
        fill_in 'menu[ingredient_number]', with: 3
        click_button '登録する'
        expect(page).to have_content 'もう一度やり直してください'
        expect(current_path).to eq menus_path
      end
    end

  end
end
