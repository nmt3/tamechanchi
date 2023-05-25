class User::MenusController < ApplicationController
  def index
    @menus = Menu.all
    @genres = Genre.all
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @menus = @genre.menus
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

end
