class BuyDelivery
  include ActiveModel::Model

  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phonenumber, :item_id, :user_id

  with_options presence: true do
    validates :postcode
    validates :city
    validates :address
    validates :phonenumber
    validates :user_id
    validates :item_id 
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
   buy = Buy.create(item_id: item_id, user_id: user_id)
   Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phonenumber: phonenumber, buy_id: buy.id)
  end
end