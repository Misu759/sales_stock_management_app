FactoryBot.define do
  factory :menu do
    name { 'test' }
    regular_cost { 800 }
  end

  factory :menu_duplicate_name, class: Menu do
    name {'test'}
    regular_cost { 1200 }
  end
end
