FactoryBot.define do
  factory :ingredient do
    name { 'test' }
    purchase_cost { 1000 }
    stock { 5000 }
    threshold { 1000 }
    unit_amount { 1000 }
  end
end
