FactoryBot.define do
  factory :supplier do
    sequence(:name) { |n| "supplier_name_#{n}" }
    delivery_cost { 500 }
    phone_number { 'xxx-xxxx-xxxx' }
  end

  factory :supplier_not_input_delivery_cost, class: Supplier do
    name { 'test' }
    phone_number { 'xxx-xxxx-xxxx' }
  end


  factory :supplier_duplicate_name, class: Supplier do
    name { 'test' }
    delivery_cost { 600 }
  end
end

