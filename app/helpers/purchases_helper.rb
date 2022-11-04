module PurchasesHelper
  def purchase_cost_per_date
    cost_per_date_columns = @purchases.joins(:ingredient).select("SUM(amount * purchase_cost) AS cost").group(:purchase_date).order(nil)
    graph_data = []
    cost_per_date_columns.each do |cost_per_date_column|
      graph_data << [cost_per_date_column.purchase_date, cost_per_date_column.cost]
    end
    graph_data
  end
end