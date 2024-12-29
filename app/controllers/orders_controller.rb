class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index


  def index 
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
    
     if @buy_delivery.valid?
        @buy_delivery.save
       redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        render :index, status: :unprocessable_entity
      end 
  end


    private
    
    def buy_params
        params.require(:buy_delivery).permit(:postcode, :prefecture_id, :city, :address, :building, :phonenumber).merge(item_id: params[:item_id], user_id: current_user.id)
    end

    def move_to_root_path
        @item = Item.find(params[:item_id])
      if (current_user.id == @item.user_id) || (Buy.exists?(item_id: @item.id))
         redirect_to root_path
      end
    end
end