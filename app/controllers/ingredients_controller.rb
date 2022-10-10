class IngredientsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @ingredients = Ingredient.page(params[:page])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "食材情報を追加しました"
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = '食材情報を更新しました'
      redirect_to ingredients_path
    else
      render 'edit'
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    flash[:notice] = "#{@ingredient.name}を削除しました"
    redirect_to ingredients_path
  end

  def search
    @results = @q.result
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :purchase_cost, :stock)
  end

  def set_q
    @q = Ingredient.ransack(params[:q])
  end

end