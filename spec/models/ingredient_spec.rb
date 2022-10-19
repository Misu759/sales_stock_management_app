require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before do
    @supplier = FactoryBot.build(:supplier)
    @supplier.save
    @ingredient = FactoryBot.build(:ingredient)
    @ingredient.supplier = @supplier
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@ingredient).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空の場合は登録できない' do
        @ingredient.name = ''
        expect(@ingredient).to be_invalid
      end
      it 'purchase_costが空の場合は登録できない' do
        @ingredient.purchase_cost = ''
        expect(@ingredient).to be_invalid
      end
      it 'stockが空の場合は登録できない' do
        @ingredient.stock = ''
        expect(@ingredient).to be_invalid
      end
      it 'unit_amountが空の場合は登録できない' do
        @ingredient.unit_amount = ''
        expect(@ingredient).to be_invalid
      end
      it 'supplierが空の場合は登録できない' do
        ingredient_not_input_supplier = FactoryBot.build(:ingredient)
        expect(ingredient_not_input_supplier).to be_invalid
      end
      it '存在しないsupplierを入力した場合は登録できない' do
        ingredient_not_input_supplier = FactoryBot.build(:ingredient)
        ingredient_not_input_supplier.supplier_id = 999
        expect(ingredient_not_input_supplier).to be_invalid
      end
    end
  end
end


