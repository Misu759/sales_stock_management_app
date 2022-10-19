require 'rails_helper'

RSpec.describe Waste, type: :model do
  before do
    ingredient = FactoryBot.build(:ingredient)
    ingredient.save
    @waste = FactoryBot.build(:waste)
    @waste.ingredient = ingredient
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@waste).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'amountが入力されていなければ登録できない' do
        @waste.amount = ''
        expect(@waste).to be_invalid
      end
      it 'dateが入力されていなければ登録できない' do
        @waste.date = ''
        expect(@waste).to be_invalid
      end
      it 'ingredientが入力されていなければ登録できない' do
        waste_not_input_ingredient = FactoryBot.build(:waste)
        expect(waste_not_input_ingredient).to be_invalid
      end
      it '存在しないingredientを入力した場合に登録できない' do
        waste_not_input_ingredient = FactoryBot.build(:waste)
        waste_not_input_ingredient.ingredient_id = 999
        expect(waste_not_input_ingredient).to be_invalid
      end
    end
  end
end
