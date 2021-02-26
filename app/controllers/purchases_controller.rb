class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  def index
    @address_purchase = AddressPurchase.new
    @item = Item.find(params[:item_id])
  end
  
  def create
     @address_purchase = AddressPurchase.new(purchase_params)
     @item = Item.find(params[:item_id])
     if @address_purchase.valid?
       
       @address_purchase.save
       redirect_to root_path
     else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:post_number, :prefecture_id, :city, :street, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:post_number, :prefecture_id, :city, :street, :building, :phone, :purchase)
  end
      
  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end
end



