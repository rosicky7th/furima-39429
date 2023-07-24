class ItemsController < ApplicationController
  before_action :select_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_to_show, only: [:edit, :update, :destroy]
  before_action :ordered_item, only: :edit

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show', status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :shipping_date_id,
      :prefecture_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end

  def redirect_to_show
    return unless current_user.id != @item.user.id

    redirect_to root_path
  end

  def ordered_item
    return unless !@item.order.id.nil? && current_user.id == @item.user.id

    redirect_to root_path
  end
end
