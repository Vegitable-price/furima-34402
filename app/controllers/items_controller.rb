class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :prevent_edit, only: [:edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  @item.destroy
  redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :describe, :price, :prefecture_id, :ship_fee_id, :ship_day_id, :status_id, :genre_id).merge(user_id: current_user.id)
  end

  def prevent_edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

