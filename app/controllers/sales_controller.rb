class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @sales_graph_data = sales_per_date
  end

  def new
    @form = Form::SaleCollection.new
  end

  def create
    @form = Form::SaleCollection.new(sale_collection_params)

    if @form.save
      redirect_to sales_path, notice: "売上を登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render new_sale_path
    end

  end

  def show; end

  def edit; end

  def update
    if @sale.update(sale_params)
      flash[:notice] = "売上情報を更新しました"
      redirect_to @sale
    else
      render 'edit'
    end
  end

  def destroy
    @menu.destroy!
    flash[:notice] = '売上情報を削除しました'
    redirect_to sales_path
  end

  def search
    @results = @q.result
    @total_sales = total_sales(@results)
    @gross_profit = gross_profit(@results)
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def set_q
    @q = Sale.ransack(params[:q])
  end

  def sale_params
    params.require(:sale).permit(:quantity, :menu_id, :date)
  end

  def sale_collection_params
    params.require(:form_sale_collection).permit(sales_attributes: [:date, :menu_id, :quantity])
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
