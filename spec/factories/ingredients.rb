FactoryBot.define do
  factory :ingredient do
    sequence(:name) { |n| "name_#{n}"}
    purchase_cost { 1000 }
    stock { 5000 }
    threshold { 1000 }
    unit_amount { 1000 }
    association :supplier
  end

  factory :ingredient_not_input_supplier, class: Ingredient do
    sequence(:name) { |n| "name_#{n}"}
    purchase_cost { 1000 }
    stock { 5000 }
    threshold { 1000 }
    unit_amount { 1000 }
  end
end
