require 'rails_helper'

RSpec.describe Sale, type: :model do
  before do
    menu = FactoryBot.build(:menu)
    menu.save
    @sale = FactoryBot.build(:sale)
    @sale.menu = menu
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'quantity, dateが入力されていれば登録できる' do
        expect(@sale).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'quantityが空の場合は登録できない' do
        @sale.quantity = ''
        expect(@sale).to be_invalid
      end
      it 'dateが空の場合は登録できない' do
        @sale.date = ''
        expect(@sale).to be_invalid
      end
      it 'menuが空の場合は登録できない' do
        sale_not_input_menu = FactoryBot.build(:sale)
        expect(sale_not_input_menu).to be_invalid
      end
      it '存在しないmenuを入力した場合は登録できない' do
        sale_not_input_menu = FactoryBot.build(:sale)
        sale_not_input_menu.menu_id = 999
        expect(sale_not_input_menu).to be_invalid
      end
    end
  end
end
