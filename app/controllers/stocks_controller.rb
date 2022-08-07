class StocksController < ApplicationController

  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      flash[:notice] = "在庫情報を更新しました"
      redirect_to @stock
    else
      render 'edit'
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:ingredient_id, :amount)
  end
end