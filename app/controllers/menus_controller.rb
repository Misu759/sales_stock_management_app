class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Menu was created successfully"
      redirect_to @menu
    else
      render 'new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "Menu was updated successfully."
      redirect_to @menu
    else
      render 'edit'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "Menu was deleted."
    redirect_to menus_path
  end
  
end

private
def menu_params
  params.require(:menu).permit(:name, :regular_cost, :description)
end
