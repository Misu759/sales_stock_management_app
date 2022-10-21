FactoryBot.define do
  factory :sale do
    quantity { 50 }
    date { 0.day.from_now }
    association :menu
  end
end
