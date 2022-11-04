module PurchasesHelper
  def purchase_cost_per_date
    cost_per_date_list = @purchases.joins(:ingredient).unscope(:order).group(:purchase_date).pluck(:purchase_date, "SUM(amount * purchase_cost) AS cost")
    graph_data = []
    cost_per_date_list.each do |cost_per_date|
      graph_data << [cost_per_date[0], cost_per_date[1]]
    end
    graph_data
  end
end