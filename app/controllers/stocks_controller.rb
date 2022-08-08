class StocksController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
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