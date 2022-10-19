require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    ingredient = FactoryBot.build(:ingredient)
    ingredient.save
    @purchase = FactoryBot.build(:purchase)
    @purchase.ingredient = ingredient
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'amount, purchase_date, waste_date, arrival_dateが入力されていれば登録できる' do
        expect(@purchase).to be_valid
      end
      it 'waste_dateが入力されていない場合も登録できる' do
        @purchase.waste_date = ''
        expect(@purchase).to be_valid
      end
      it 'arrival_dateが入力されていない場合も登録できる' do
        @purchase.arrival_date = ''
        expect(@purchase).to be_valid
      end
      it 'amoutに入力した値がunused_amountに代入されて登録される' do
        @purchase.save
        expect(@purchase.unused_amount).to eq @purchase.amount
      end
    end

    context '新規登録できないとき' do
      it 'amountが空の場合は登録できない' do
        @purchase.amount = ''
        expect(@purchase).to be_invalid
      end
      it 'purchase_dateが空の場合は登録できない' do
        @purchase.purchase_date = ''
        expect(@purchase).to be_invalid
      end
      it 'ingredientが空の場合は登録できない' do
        purchase_not_input_ingredient = FactoryBot.build(:purchase)
        expect(purchase_not_input_ingredient).to be_invalid
      end
      it '存在しないingredientを入力した場合は登録できない' do
        purchase_not_input_ingredient = FactoryBot.build(:purchase)
        purchase_not_input_ingredient.ingredient_id = 999
        expect(purchase_not_input_ingredient).to be_invalid
      end
    end
  end
end
