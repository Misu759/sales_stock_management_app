class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
    @purchase_graph_data = purchase_cost_per_date
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      flash[:notice] = '発注情報の追加完了'
      redirect_to @purchase
    else
      render 'new'
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      flash[:notice] = '発注情報の更新完了'
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = "#{@purchase.ingredient.name}の発注情報を削除しました"
    redirect_to purchases_path
  end

  private

  def purchase_params
    params.require(:purchase).permit(:ingredient_id, :amount, :purchase_date, :waste_date, :delivery_cost)
  end

  def purchase_cost_per_date
    cost_per_date_columns = Purchase.joins(:ingredient).select(:purchase_date, "sum(amount * purchase_cost) as total").group(:purchase_date)
    graph_data = []
    cost_per_date_columns.each do |cost_per_date_column|
      graph_data.append([cost_per_date_column.purchase_date, cost_per_date_column.total])
    end
    graph_data
  end

end


