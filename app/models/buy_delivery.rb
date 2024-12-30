class BuyDelivery
  include ActiveModel::Model

  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phonenumber, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows(e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phonenumber, length: { minimum: 10,maximum: 11, message: 'is too short'}
    validates :user_id
    validates :item_id
  end
  validates :phonenumber, numericality: { only_integer: true, message: 'is invalid. Input only number'}
  

  def save
       buy = Buy.create(item_id: item_id, user_id: user_id)
       Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phonenumber: phonenumber, buy_id: buy.id)
  end
end