class WastesController < ApplicationController

  def index
    @wastes = Waste.all
  end

  def new
    @waste = Waste.new
  end

  def create
    @waste = Waste.new(waste_params)
    if @waste.save
      flash[:notice] = "廃棄情報を追加しました"
      redirect_to wastes_path
    else
      flash.now[:danger] = "もう一度やり直してください"
      render 'new'
    end
  end

  def edit
    @waste = Waste.find(params[:id])
  end

  def update
    @waste = Waste.find(params[:id])
    if @waste.update(waste_params)
      flash[:notice] = "廃棄情報を更新しました"
      redirect_to wastes_path
    else
      render 'edit'
    end
  end

  def destroy
    @waste = Waste.find(params[:id])
    @waste.destroy
    flash[:notice] = '在庫情報を削除しました'
    redirect_to wastes_path
  end

  private

  def waste_params
    params.require(:waste).permit(:ingredient_id, :amount, :date)
  end
end
