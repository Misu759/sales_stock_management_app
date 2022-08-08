class SalesController < ApplicationController

  def index
    @sales = Sale.where(date: Date.today)
    @total_sales = total_sales(@sales)
    @gross_profit = gross_profit(@sales)
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

  private
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
end
