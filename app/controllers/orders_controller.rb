class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create, :move_to_root_path]
  before_action :move_to_root_path, only: :index


  def index 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    
    @buy_delivery = BuyDelivery.new
  end

  def create
    @buy_delivery = BuyDelivery.new(buy_params)
     if @buy_delivery.valid?
         pay_item
        @buy_delivery.save
        redirect_to root_path
      else
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        render :index, status: :unprocessable_entity
      end 
  end


    private
    
    def buy_params
        params.require(:buy_delivery).permit(:postcode, :prefecture_id, :city, :address,:building, :phonenumber).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def move_to_root_path  
      if (current_user.id == @item.user_id) || (Buy.exists?(item_id: @item.id))
         redirect_to root_path
      end
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token], 
        currency: 'jpy'
      )
    end
end