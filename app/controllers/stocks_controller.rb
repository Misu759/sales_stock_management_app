class StocksController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  def index
    @ingredients = Ingredient.all
  end


  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @stock = Ingredient.find(params[:id])
    if @stock.update(stock_params)
      flash[:notice] = "在庫情報を更新しました"
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    flash[:notice] = '在庫情報を削除しました'
    redirect_to stocks_path
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Stock.ransack(params[:q])
  end

  def stock_params
    params.require(:stock).permit(:ingredient_id, :amount)
  end
end