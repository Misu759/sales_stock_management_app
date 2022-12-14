class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]
  before_action :set_q, only: %i[index search]

  include PurchasesHelper

  def index
    @purchases = Purchase.all.order(created_at: :desc).includes(:ingredient).page(params[:page])
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

  def show; end

  def edit; end

  def update
    if @purchase.update(purchase_params)
      flash[:notice] = '発注情報の更新完了'
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase.destroy!
    flash[:notice] = "#{@purchase.ingredient.name}の発注情報を削除しました"
    redirect_to purchases_path
  end

  def arrival_check
    purchase = Purchase.find(params[:purchase_id])
    if purchase.arrival_check
      purchase.update(arrival_check: false)
      purchase.ingredient.stock -= purchase.amount * purchase.ingredient.unit_amount
      purchase.ingredient.save!
    else
      purchase.update(arrival_check: true)
      purchase.ingredient.stock += purchase.amount * purchase.ingredient.unit_amount
      purchase.ingredient.save!
    end
    redirect_back(fallback_location: root_path)
  end

  def confirm
    @purchases = Purchase.where("arrival_check = ? and arrival_date >= ? ", false, Date.today).includes(:ingredient)
  end

  def search
    @purchases = @q.result
    @purchase_graph_data = purchase_cost_per_date
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:ingredient_id, :amount, :purchase_date, :waste_date, :unused_amount, :arrival_date)
  end

  def set_q
    @q = Purchase.ransack(params[:q])
  end

end


