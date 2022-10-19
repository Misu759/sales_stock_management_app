require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@menu).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空の場合は登録できない' do
        @menu.name = ''
        expect(@menu).to be_invalid
      end
      it 'categoryが空の場合は登録できない' do
        @menu.category = ''
        expect(@menu).to be_invalid
      end
      it 'nameが重複している場合が登録できない' do
        @menu.save
        menu_name_duplicate = FactoryBot.build(:menu_duplicate_name)
        expect(menu_name_duplicate).to be_invalid
      end
    end
  end
end
