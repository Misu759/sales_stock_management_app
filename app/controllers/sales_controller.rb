class SalesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @sales_graph_data = sales_per_date
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      flash[:notice] = "売上情報の追加完了"
      redirect_to @sale
    else
      render 'new'
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      flash[:notice] = "売上情報を更新しました"
      redirect_to @sale
    else
      render 'edit'
    end
  end

  def destroy
    @menu = Sale.find(params[:id])
    @menu.destroy
    flash[:notice] = '売上情報を削除しました'
    redirect_to sales_path
  end

  def search
    @results = @q.result
    @total_sales = total_sales(@results)
    @gross_profit = gross_profit(@results)
  end

  private

  def set_q
    @q = Sale.ransack(params[:q])
  end

  def sale_params
    params.require(:sale).permit(:quantity, :menu_id, :date)
  end

  def total_sales(sales)
    total = 0
    sales.each {|sale| total += sale.menu.regular_cost * sale.quantity}
    total
  end

  def gross_profit(sales)
    total = 0
    sales.each {|sale| total += sale.menu.cost_price * sale.quantity}
    total
  end

  def sales_per_date
    sales_graph_data = []
    days = 7
    (0..days - 1).each do |i|
      day = Date.today - i.days
      sales = Sale.where(date: day)
      total_sales = total_sales(sales)
      sales_graph_data << [day, total_sales]
    end
    sales_graph_data
  end
end

