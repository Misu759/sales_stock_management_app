class MenusController < ApplicationController
  before_action :set_menu, only: %i[destroy update edit show]

  def index
    @menus = Menu.page(params[:page])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "メニュー情報を追加しました"
      redirect_to @menu
    else
      flash.now[:danger] = "もう一度やり直してください"
      render 'new'
    end
  end

  def show
    @menu_ingredients = MenuIngredient.where(menu: @menu)
  end

  def edit; end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "メニュー情報を更新しました"
      redirect_to @menu
    else
      flash.now[:danger] = "もう一度やり直してください"
      render 'edit'
    end
  end

  def destroy
    @menu.destroy!
    flash[:notice] = "#{@menu.name}を削除しました"
    redirect_to menus_path
  end
  
end

private

def set_menu
  @menu = Menu.find(params[:id])
end

def menu_params
  params.require(:menu).permit(:name, :regular_cost, :description, :category)
end
