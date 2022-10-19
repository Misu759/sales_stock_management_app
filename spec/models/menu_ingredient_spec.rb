require 'rails_helper'

RSpec.describe MenuIngredient, type: :model do
  before do
    supplier = FactoryBot.build(:supplier)
    @ingredient = FactoryBot.build(:ingredient)
    @ingredient.supplier = supplier
    @ingredient.save

    @menu = FactoryBot.build(:menu)
    @menu.save

    @menu_ingredient = FactoryBot.build(:menu_ingredient)
    @menu_ingredient.menu = @menu
    @menu_ingredient.ingredient = @ingredient
  end

  describe '新規登録' do
    context '新規登録ができるとき' do
      it 'menu, ingredient, amountが入力されていれば登録できる' do
        expect(@menu_ingredient).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'amountが入力されていない場合は登録できない' do
        @menu_ingredient.amount = ''
        expect(@menu_ingredient).to be_invalid
      end
      it 'ingredientが入力されていない場合は登録できない' do
        menu_ingredient = FactoryBot.build(:menu_ingredient)
        menu_ingredient.menu = @menu
        expect(menu_ingredient).to be_invalid
      end
      it 'menuが入力されていない場合は登録できない' do
        menu_ingredient = FactoryBot.build(:menu_ingredient)
        menu_ingredient.ingredient = @ingredient
        expect(menu_ingredient).to be_invalid
      end
      it 'menu, ingredientの組み合わせが重複している場合は登録できない' do
        @menu_ingredient.save

        duplicate_menu_ingredient = FactoryBot.build(:menu_ingredient)
        duplicate_menu_ingredient.menu = @menu
        duplicate_menu_ingredient.ingredient = @ingredient

        expect(duplicate_menu_ingredient).to be_invalid
      end
    end
  end
end
