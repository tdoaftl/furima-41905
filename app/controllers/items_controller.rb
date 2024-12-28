class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :move_to_index]
  before_action :move_to_index, only: [:edit, :destroy]

  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
   else
     render :new, status: :unprocessable_entity
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
     render :edit, status: :unprocessable_entity
   end
 end

 def destroy
  item = Item.find(params[:id])
  item.destroy
  redirect_to root_path 
end


  private

  def item_params
    params.require(:item).permit(:name, :explain, :image, :price,:category_id,:condition_id,:shipping_id,:prefecture_id,:day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
