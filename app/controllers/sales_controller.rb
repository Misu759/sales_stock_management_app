class SalesController < ApplicationController

  def index
    @sales = Sale.all
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

  private
  def sale_params
    params.require(:sale).permit(:quantity, :menu_id, :date)
  end
end
