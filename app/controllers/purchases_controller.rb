class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @address_purchase = AddressPurchase.new
  end

  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:post_number, :prefecture_id, :city, :street, :building, :phone).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
