FactoryBot.define do
  factory :purchase do
    amount { 10000 }
    purchase_date { '2022/10/01' }
    waste_date { '2022/10/10' }
    arrival_date { '2022/10/3' }
  end

  factory :purchase_without_association, class: Purchase do
    amount { 10000 }
    purchase_date { '2022/10/01' }
    waste_date { '2022/10/10' }
    arrival_date { '2022/10/3' }
  end
end