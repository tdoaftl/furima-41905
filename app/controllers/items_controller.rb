class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

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


  private

  def item_params
    params.require(:item).permit(:name, :explain, :image, :price,:category_id,:condition_id,:shipping_id,:prefecture_id,:day_id).merge(user_id: current_user.id)
  end
end
