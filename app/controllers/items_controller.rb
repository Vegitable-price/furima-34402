class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :prevent_edit, only: [:edit, :update, :destroy]
  before_action :sold_item, only: [:edit, :update, :destroy]
  before_action :set_search

  def index
    @items = Item.order('created_at DESC')
    set_item_column
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @messages = Message.all
    @message = Message.new
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def ransack_search
  end

  private

  def item_params
    params.require(:items_tag).permit(:name, :describe, :price, :prefecture_id, :ship_fee_id, :ship_day_id, :status_id, :genre_id, :tag_name, images: []).merge(user_id: current_user.id)
  end

  def prevent_edit
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def sold_item
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def set_search
    @search = Item.ransack(params[:q])
    @items = @search.result

  end

  def set_item_column
    @item_name = Item.select("name").distinct
  end

end


