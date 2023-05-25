class User::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def thanks
  end

  def create
    @inquiry = Inquiry.new(inquiries_params)
    @inquiry.save
    redirect_to thanks_inquiries_path
  end

  private
  def inquiries_params
     params.require(:inquiry).permit(:name, :title, :content, :phone, :mail)
  end

end
