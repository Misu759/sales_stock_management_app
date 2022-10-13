class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]
  before_action :set_q, only: [:index, :search]

  include SalesHelper

  def index
    @sales_graph_data = sales_per_date
  end

  def new
    # 日付の入力を一つにまとめる
    @form_date = Date.today
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
    @sale.destroy!
    flash[:notice] = '売上情報を削除しました'
    redirect_to sales_path
  end

  def search
    @results = @q.result.includes(menu: :ingredients)
    @ingredients = Ingredient.all
    @ingredients_hash = get_amount_of_ingredients(@results)
    @total_sales = total_sales(@results)
    @cost_of_sales = cost_of_sales(@results)
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
    date = params[:form_sale_collection][:form_date]
    forms = params.require(:form_sale_collection).permit(sales_attributes: [:menu_id, :quantity])
    forms[:sales_attributes].each_value { |form| form[:date] = date }
    forms
  end
end
