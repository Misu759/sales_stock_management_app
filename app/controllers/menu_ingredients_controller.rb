class MenuIngredientsController < ApplicationController
  before_action :set_menu_ingredient, only: %i[destroy update edit]

  def new
    @menu = Menu.find(params[:menu_id])
    @ingredient_number = params[:ingredient_number] ? params[:ingredient_number].to_i : 1
    @form = Form::MenuIngredientCollection.new(@ingredient_number)
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @form = Form::MenuIngredientCollection.new(params[:number], menu_ingredient_collection_params)

    if @form.save
      flash[:notice] = "#{@menu.name}の材料情報を登録しました"
      redirect_to @menu
    else
      flash.now[:danger] = '材料情報の登録に失敗しました'
      render new_menu_ingredient_path
    end
  end

  def edit; end

  def update
    if @menu_ingredient.update(menu_ingredient_params)
      flash[:notice] = "材料の量を更新しました"
      redirect_to menu_path(@menu_ingredient.menu)
    else
      flash.now[:danger] = '更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @menu_ingredient.destroy!
    flash[:notice] = "材料を削除しました"
    redirect_to menu_path(@menu_ingredient.menu)
  end

  private

  def set_menu_ingredient
    @menu_ingredient = MenuIngredient.find(params[:id])
  end

  def menu_ingredient_collection_params
    menu_id = params[:menu_id]
    forms = params.require(:form_menu_ingredient_collection).permit(menu_ingredients_attributes: [:ingredient_id, :amount])
    forms[:menu_ingredients_attributes].each_value { |form| form[:menu_id] = menu_id }
    forms
  end

  def menu_ingredient_params
    params.require(:menu_ingredient).permit(:menu_id, :ingredient_id, :amount)
  end
end