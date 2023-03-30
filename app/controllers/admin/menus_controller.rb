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

  end

  def update
  end

  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :price)
  end


end
