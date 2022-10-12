Menu.create!(name: 'トースト＆マーガリン', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'チーズトースト', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'あんバタートースト', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'たまごサンド', regular_cost: 700, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: '鳥のバジルサンド', regular_cost: 700, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'ホットドック（ケチャップ＆マスタード）', regular_cost: 700, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'ホットドック（特製マヨ）', regular_cost: 700, description: 'メニューに関する簡単な説明', category: 0)
Menu.create!(name: 'ホットドック（チリソース）', regular_cost: 700, description: 'メニューに関する簡単な説明', category: 0)

Menu.create!(name: 'キャラメルグラニータ', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 1)
Menu.create!(name: '抹茶グラニータ', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 1)
Menu.create!(name: 'チョコレートグラニータ', regular_cost: 600, description: 'メニューに関する簡単な説明', category: 1)
Menu.create!(name: 'ストロベリーグラニータ', regular_cost: 650, description: 'メニューに関する簡単な説明', category: 1)

Menu.create!(name: 'ハンドドリップ', regular_cost: 500, description: 'メニューに関する簡単な説明', category: 2)
Menu.create!(name: 'アメリカーノ', regular_cost: 500, description: 'メニューに関する簡単な説明', category: 2)
Menu.create!(name: 'ラテ', regular_cost: 500, description: 'メニューに関する簡単な説明', category: 2)
Menu.create!(name: 'カプチーノ', regular_cost: 500, description: 'メニューに関する簡単な説明', category: 2)


Ingredient.create!(name: '牛乳', purchase_cost: 0.199)
Ingredient.create!(name: 'コーヒー豆', purchase_cost: 5.0)
Ingredient.create!(name: 'ココアP', purchase_cost: 1.135)
Ingredient.create!(name: '抹茶P', purchase_cost: 2.22)

Ingredient.create!(name: 'ほうじ茶', purchase_cost: 2.03)
Ingredient.create!(name: 'アールグレイ', purchase_cost: 6.6)
Ingredient.create!(name: 'アップル', purchase_cost: 7.65)
Ingredient.create!(name: 'アッサム', purchase_cost: 6.15)
Ingredient.create!(name: 'カモミール', purchase_cost: 11.3)


Ingredient.create!(name: 'トースト用パン', purchase_cost: 34.29)
Ingredient.create!(name: '加塩バター', purchase_cost: 1.59)
Ingredient.create!(name: 'ヨーロッパチーズ', purchase_cost: 1.88)
Ingredient.create!(name: 'マヨネーズ', purchase_cost: 0.362)
Ingredient.create!(name: '餡子', purchase_cost: 2.0)
Ingredient.create!(name: 'サンドイッチ用パン', purchase_cost: 18.34)




MenuIngredient.create!(menu: Menu.find_by(name: 'トースト＆マーガリン'), ingredient: Ingredient.find_by(name: 'トースト用パン'), amount: 1)
MenuIngredient.create!(menu: Menu.find_by(name: 'トースト＆マーガリン'), ingredient: Ingredient.find_by(name: '加塩バター'), amount: 10)
MenuIngredient.create!(menu: Menu.find_by(name: 'チーズトースト'), ingredient: Ingredient.find_by(name: 'トースト用パン'), amount: 1)
MenuIngredient.create!(menu: Menu.find_by(name: 'チーズトースト'), ingredient: Ingredient.find_by(name: 'ヨーロッパチーズ'), amount: 70)
MenuIngredient.create!(menu: Menu.find_by(name: 'チーズトースト'), ingredient: Ingredient.find_by(name: 'マヨネーズ'), amount: 10)
MenuIngredient.create!(menu: Menu.find_by(name: 'あんバタートースト'), ingredient: Ingredient.find_by(name: 'サンドイッチ用パン'), amount: 2)
MenuIngredient.create!(menu: Menu.find_by(name: 'あんバタートースト'), ingredient: Ingredient.find_by(name: '餡子'), amount: 50)
MenuIngredient.create!(menu: Menu.find_by(name: 'あんバタートースト'), ingredient: Ingredient.find_by(name: '加塩バター'), amount: 6)


menus = Menu.all
menus.each do |menu|
  menu.sales.create!(quantity: 80, date: Date.today)
  menu.sales.create!(quantity: 100, date: Date.today - 1)
  menu.sales.create!(quantity: 120, date: Date.today - 2)
  menu.sales.create!(quantity: 90, date: Date.today - 3)
  menu.sales.create!(quantity: 100, date: Date.today - 4)
  menu.sales.create!(quantity: 120, date: Date.today - 5)
  menu.sales.create!(quantity: 150, date: Date.today - 6)
end


ingredients = Ingredient.all
ingredients.each do |ingredient|
  ingredient.purchases.create!(amount: 70, delivery_cost: 100, purchase_date: Date.today)
  ingredient.purchases.create!(amount: 180, delivery_cost: 100, purchase_date: Date.today - 1)
  ingredient.purchases.create!(amount: 140, delivery_cost: 100, purchase_date: Date.today - 2)
  ingredient.purchases.create!(amount: 60, delivery_cost: 100, purchase_date: Date.today - 3)
  ingredient.purchases.create!(amount: 80, delivery_cost: 100, purchase_date: Date.today - 4)
end

