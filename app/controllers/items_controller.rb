class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :prevent_edit, only: [:edit]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :image, :describe, :price, :prefecture_id, :ship_fee_id, :ship_day_id, :status_id, :genre_id).merge(user_id: current_user.id)
  end

  def prevent_edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end

