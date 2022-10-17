class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[edit update show destroy]
  before_action :set_q, only: %i[index search]

  def index
    @ingredients = Ingredient.all
    @alert_ingredient_name_list = []
    @ingredients.each do |ingredient|
      ingredient.decorate.alert_purchase(@alert_ingredient_name_list)
    end
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

  def edit; end

  def update
    if @ingredient.update(ingredient_params)
      flash[:notice] = '食材情報を更新しました'
      redirect_to ingredients_path
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @ingredient.destroy!
    flash[:notice] = "#{@ingredient.name}を削除しました"
    redirect_to ingredients_path
  end

  def search
    @results = @q.result
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :purchase_cost, :stock, :unit_amount, :threshold, :supplier_id)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_q
    @q = Ingredient.ransack(params[:q])
  end

end