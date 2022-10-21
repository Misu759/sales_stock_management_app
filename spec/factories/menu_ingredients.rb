FactoryBot.define do
  factory :menu_ingredient do
    amount { 5 }
    association :ingredient
  end

  factory :menu_ingredient_not_input_ingredient, class: MenuIngredient do
    amount { 5 }
  end
end
