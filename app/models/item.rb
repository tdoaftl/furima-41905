class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :day
  belongs_to :prefecture

  validates :image,           presence: true
  validates :name,            presence: true
  validates :explain,         presence: true
  validates :price,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,          numericality: { other_than: 1 , message: "can't be blank"}
  
end
