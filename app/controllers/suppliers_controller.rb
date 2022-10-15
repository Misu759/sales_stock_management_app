class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier
    else
      render new_supplier_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      flash[:notice] = "仕入れ先情報を更新しました"
      redirect_to @supplier
    else
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @supplier.destroy!
    flash[:notice] = '仕入れ先情報を削除しました'
    redirect_to suppliers_path
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :delivery_cost, :phone_number)
  end
end