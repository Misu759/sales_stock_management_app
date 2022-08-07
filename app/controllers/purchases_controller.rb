class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
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

end
