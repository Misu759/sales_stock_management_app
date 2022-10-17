module SalesHelper
  # 1日の売上に対して使用した食材の情報をハッシュで返す
  def get_amount_of_ingredients(sales)
    ingredients_hash = Hash.new
    sales.each do |sale|
      # 売上の個数がnilでない場合のみ
      if sale.quantity
        sale.menu.menu_ingredients.each do |menu_ingredient|
          if ingredients_hash[menu_ingredient.ingredient.id]
            ingredients_hash[menu_ingredient.ingredient.id] += menu_ingredient.amount * sale.quantity
          else
            ingredients_hash[menu_ingredient.ingredient.id] = menu_ingredient.amount * sale.quantity
          end
        end
      end
    end
    ingredients_hash
  end

  def total_sales(sales)
    total = 0
    sales.each {|sale| total += sale.menu.regular_cost * sale.quantity}
    total
  end

  def cost_of_sales(sales)
    total = 0
    sales.each {|sale| total += sale.menu.decorate.cost_price * sale.quantity}
    total
  end

  def sales_per_date
    sales_graph_data = []
    days = 7
    (0..days - 1).each do |i|
      day = Date.today - i.days
      sales = Sale.where(date: day).includes(:menu)
      total_sales = total_sales(sales)
      sales_graph_data << [day, total_sales]
    end
    sales_graph_data
  end
end
