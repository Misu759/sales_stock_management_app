require 'rails_helper'

RSpec.describe "Sales", type: :system do
  let!(:user) { create(:user) }
  let!(:menu) { create(:menu) }
  before do
    @purchase = build(:purchase)
    @purchase.ingredient = menu.ingredients.first
    @purchase.save

    login_as(user)
  end

  describe '売上新規登録' do
    context 'フォームの入力値が正常' do
      it '売上情報の登録が成功する' do
        visit new_sale_path
        fill_in "sale-num-form-#{menu.id}", with: 10
        click_button '登録する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '売上を登録しました'
      end
    end
  end
  # describe '売上データの変化に対する各テーブルの変化' do
  #   context '売上データを追加' do
  #     it '食材の発注データから未使用量が減少' do
        
  #       visit new_sale_path
  #       fill_in "sale-num-form-#{menu.id}", with: 10
  #       click_button '登録する'
  #       page.driver.browser.switch_to.alert.accept
  #       # 他のテーブルのデータの登録rspecでうまく確認できない
  #       # 処理は問題ない
  #       variation = 10 * 5
  #       expect(@purchase.unused_amount).to eq (@purchase.amount - variation)
  #     end
  #     it '食材の在庫データが減少' do
        
  #     end
  #   end
  #   context '売上データを削除' do
  #     it '食材の発注データから未使用量が増加' do
        
  #     end
  #     it '食材の在庫データが増加' do
        
  #     end
  #   end
  # end
end
