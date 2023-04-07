class Admin::MenusController < ApplicationController
  before_action :authenticate_admin!
  def new
    @menu = Menu.new
  end

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to admin_menu_path(@menu.id)
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to admin_menu_path(menu.id)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price, :image, :genre_id)
  end


end
