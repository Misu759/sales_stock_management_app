require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before do
    @supplier = FactoryBot.build(:supplier)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@supplier).to be_valid
      end
      it 'delivery_costが入力されていない場合はデフォルト値が入り, 登録できる' do
        @supplier_not_input_delivery_cost = FactoryBot.build(:supplier_not_input_delivery_cost)
        expect(@supplier_not_input_delivery_cost.delivery_cost).to eq 0
        expect(@supplier_not_input_delivery_cost).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空の場合は登録できない' do
        @supplier.name = ''
        expect(@supplier).to be_invalid
      end
      it 'delivery_costが空の場合は登録できない' do
        @supplier.delivery_cost = ''
        expect(@supplier).to be_invalid
      end
      it 'phone_numberが20文字以上の場合は登録できない' do
        @supplier.phone_number = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        expect(@supplier).to be_invalid
      end
      it 'nameが重複している場合は登録できない' do
        supplier = FactoryBot.create(:supplier_duplicate_name)
        supplier_duplicate_name = FactoryBot.build(:supplier_duplicate_name)
        expect(supplier_duplicate_name).to be_invalid
      end
    end
  end
end
