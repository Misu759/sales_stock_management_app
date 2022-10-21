FactoryBot.define do
  factory :menu do
    sequence(:name) { |n| "test_#{n}" }
    regular_cost { 800 }

    after(:build) do |menu|
      menu.menu_ingredients << create(:menu_ingredient, menu: menu)
    end
  end

  factory :menu_with_purchase, class: Menu do
    name { 'test' }
    regular_cost { 800 }

    after(:build) do |menu|
      menu.menu_ingredients << create(:menu_ingredient, menu: menu)
      purchase = build(:purchase_without_association)
      purchase.ingredient = menu.menu_ingredients.first.ingredient
      purchase.save
    end
  end

  factory :menu_duplicate_name, class: Menu do
    name {'test'}
    regular_cost { 1200 }
  end
end
