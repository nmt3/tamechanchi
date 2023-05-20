class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to "/admin"
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to "/admin"
  end

  private

  def shop_params
    params.require(:shop).permit(:address, :post_code, :business_time, :business_day, :holiday, :telephone)
  end


end
