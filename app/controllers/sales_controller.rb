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
    @menus = Menu.all
  end

  def create
    @form_date = Date.today
    @menus = Menu.all
    @form = Form::SaleCollection.new(sale_collection_params)

    is_success = false
    if @form.save
      # 在庫量を変化させる処理
      ingredients_hash = get_amount_of_ingredients(@form.sales)
      ingredients_hash.each do |key, value|
        ingredient = Ingredient.find(key)
        ingredient.stock -= value
        # TODO エラーハンドリング
        ingredient.save!

        # 発注した順番に食材を使用していく → 廃棄期限迫っている食材を警告するため
        # 発注情報が登録されており，未使用量がある食材の場合のみ登録
        purchase = ingredient.purchases.where("unused_amount > 0").first
        if purchase
          purchase.decorate.update_amount_to_purchase(value)
          is_success = true
        end
      end
    end

    if is_success
      redirect_to confirm_sales_path(date: params[:form_sale_collection][:form_date]), notice: "売上を登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render new_sale_path
    end
  end

  def show; end

  def edit; end

  def update
    # 売上の変化に応じて在庫量を変化させる処理
    before_quantity = @sale.quantity
    if @sale.update(sale_params)
      flash[:notice] = "売上情報を更新しました"
      after_quantity = @sale.quantity
      variation = after_quantity - before_quantity
      @sale.menu.menu_ingredients.each do |menu_ingredient|
        menu_ingredient.ingredient.stock += menu_ingredient.amount * variation
        # TODO エラーハンドリング
        menu_ingredient.ingredient.save!
        # TODO 売上情報の更新に対して発注単位の情報の更新
      end
      redirect_to @sale
    else
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @sale.destroy!
    # 売上の削除に応じて在庫量を変化させる
    @sale.menu.menu_ingredients.each do |menu_ingredient|
      menu_ingredient.ingredient.stock += menu_ingredient.amount * @sale.quantity
      # TODO エラーハンドリング
      menu_ingredient.ingredient.save!
    end
    flash[:notice] = '売上情報を削除しました'
    redirect_to sales_path
  end

  def search
    @date = params[:q][:date_eq]
    @results = @q.result.includes(menu: :ingredients)
    @ingredients = Ingredient.all
    @ingredients_hash = get_amount_of_ingredients(@results)
    @total_sales = total_sales(@results)
    @cost_of_sales = cost_of_sales(@results)
  end

  def confirm
    @sales = Sale.where(date: params[:date]).includes(menu: :ingredients)
    @list = []
    @ingredients = Ingredient.all
    @ingredients_hash = get_amount_of_ingredients(@sales)
    @total_sales = total_sales(@sales)
    @cost_of_sales = cost_of_sales(@sales)
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
